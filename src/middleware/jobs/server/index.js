const router = require(`koa-router`)();
const uuidGenerator = require(`node-uuid`);
const Promise = require(`bluebird`);
const StateMachine = Promise.promisifyAll(require(`./stateMachine`));
const Stopwatch = Promise.promisifyAll(require('timer-stopwatch'));

const jobsRouter = require(`./routes`);
const job = require(`./model/job`);

/**
 * This is a Jobs class.
 */
class Jobs {
  /**
   * A Jobs server class
   * @param {Object} app - The parent Koa app.
   * @param {string} routeEndpoint - The relative endpoint.
   */
  constructor(app, routeEndpoint) {
    app.context.jobs = this; // External app reference variable

    this.app = app;
    this.logger = app.context.logger;
    this.routeEndpoint = routeEndpoint;
    this.router = router;
    this.jobs = [];
  }

  /**
   * initialize the jobs endpoint
   */
  async initialize() {
    try {
      await this.setupRouter();
      // initial setup of the db
      this.Job = await job(this.app);

      this.logger.info(`Jobs instance initialized`);
    } catch (ex) {
      this.logger.error(`Jobs initialization error`, ex);
    }
  }

  /**
   * Create a job object
   */
  async createJobObject(userUuid) {
    let jobObject;

    const cancelable = ['running', 'paused'];
    const uuid = userUuid ? userUuid : await uuidGenerator.v1();
    const fsmSettings = {
      uuid,
      initial: 'created',
      error: (eventName, from, to, args, errorCode, errorMessage) => {
        const fsmError = `Invalid job ${uuid} state change on event "${eventName}" from "${from}" to "${to}"\nargs: "${args}"\nerrorCode: "${errorCode}"\nerrorMessage: "${errorMessage}"`;
        this.logger.error(fsmError);
        throw fsmError;
      },
      events: [
        /* eslint-disable no-multi-spaces */
        { name: 'setFile',     from: 'created',     to: 'settingFile' },
        { name: 'setFileFail', from: 'settingFile', to: 'created'     },
        { name: 'setFileDone', from: 'settingFile', to: 'ready'       },
        { name: 'start',       from: 'ready',       to: 'starting'    },
        { name: 'startFail',   from: 'starting',    to: 'ready'       },
        { name: 'startDone',   from: 'starting',    to: 'running'     },
        { name: 'pause',       from: 'running',     to: 'pausing'     },
        { name: 'pause',       from: 'paused',      to: 'paused'      },
        { name: 'pauseFail',   from: 'pausing',     to: 'running'     },
        { name: 'pauseDone',   from: 'pausing',     to: 'paused'      },
        { name: 'resume',      from: 'paused',      to: 'resuming'    },
        { name: 'resume',      from: 'running',     to: 'running'     },
        { name: 'resumeFail',  from: 'resuming',    to: 'paused'      },
        { name: 'resumeDone',  from: 'resuming',    to: 'running'     },
        { name: 'complete',    from: 'running',     to: 'complete'    },
        { name: 'cancel',      from: cancelable,    to: 'canceling'  },
        { name: 'cancelFail',  from: 'canceling',  to: 'canceled'    },
        { name: 'cancelDone',  from: 'canceling',  to: 'canceled'    },
        /* eslint-enable no-multi-spaces */
      ],
      callbacks: {
        onenterstate: (event, from, to) => {
          this.logger.info(`Job event ${event}: Transitioning from ${from} to ${to}.`);
          const theJob = this.getJob(uuid);
          if (event === `startup`) {
            this.app.io.emit(`jobEvent`, { state: `created`, uuid, created: undefined, elapsed: undefined, percentComplete: 0 });
          } else {
            this.app.io.emit(`jobEvent`, theJob);
          }
        },
      },
    };

    const fsm = await StateMachine.create(fsmSettings);
    const stopwatch = await new Stopwatch(false, { refreshRateMS: 1000 });

    jobObject = {
      uuid,
      fsm,
      stopwatch,
      fileUuid: undefined,
      started: undefined,
      elapsed: undefined,
      percentComplete: 0,
    };

    stopwatch.onTime((time) => {
      this.app.io.emit('jobEvent', this.jobToJson(jobObject));
    });
    // injecting the fsm callback after the fsm object is created to create a job reference within the socket event
    // jobObject.fsm.callbacks.onenterstate = (event, from, to) => {
    //   this.app.io.emit(`jobEvent`, jobObject);
    //   this.logger.info(`Job event ${event}: Transitioning from ${from} to ${to}.`);
    // };
    this.jobs.push(jobObject);
    return jobObject;
  }

  /**
   * Set up the jobs' instance's router
   */
  async setupRouter() {
    try {
      // Populate this.router with all routes
      // Then register all routes with the app
      await jobsRouter(this);

      // Register all router routes with the app
      this.app.use(this.router.routes()).use(this.router.allowedMethods());
      this.logger.info(`Jobs router setup complete`);
    } catch (ex) {
      this.logger.error(`Jobs router setup error`, ex);
    }
  }

  /**
   * Turn a job object into a REST reply friendly object
   */
  jobToJson(job) {
    const started = !!job.started ? job.started : null;
    const elapsed = !!job.started ? job.stopwatch.ms : null;
    return {
      uuid: job.uuid,
      state: job.fsm.current,
      fileUuid: job.fileUuid,
      started,
      elapsed,
      percentComplete: job.percentComplete,
    };
  }

  /**
   * Turn an array of job objects into a REST reply friendly array of jobs
   */
  jobsToJson(jobs) {
    return jobs.map((job) => {
      return this.jobToJson(job);
    });
  }

  /**
   * A generic call to retreive a job by its uuid
   */
  getJob(jobUuid) {
    return this.jobsToJson(this.jobs).find((job) => {
      return job.uuid === jobUuid;
    });
  }

  /**
   * A generic call to retreive a json friendly list of jobs
   */
  getJobs() {
    return this.jobsToJson(this.jobs);
  }

  /*
   * Start processing a job
   */
  async startJob(job) {
    try {
      await job.fsm.start();
      await this.app.context.bot.startJob(job);
      job.started = new Date().getTime();
      await job.stopwatch.start();
      await job.fsm.startDone();
    } catch (ex) {
      await job.fsm.startFail();
      const errorMessage = `Job start failure ${ex}`;
      this.logger.error(errorMessage);
    }
  }

  /*
   * Pause processing a job
   */
  async pauseJob(job) {
    try {
      await job.fsm.pause();
      await this.app.context.bot.pauseJob();
      await job.stopwatch.stop();
      await job.fsm.pauseDone();
    } catch (ex) {
      await job.fsm.pauseFail();
      const errorMessage = `Job pause failure ${ex}`;
      this.logger.error(errorMessage);
    }
  }

  /*
   * Resume processing a job
   */
  async resumeJob(job) {
    try {
      job.fsm.resume();
      await this.app.context.bot.resumeJob();
      await job.stopwatch.start();
      job.fsm.resumeDone();
    } catch (ex) {
      job.fsm.resumeFail();
      const errorMessage = `Job resume failure ${ex}`;
      this.logger.error(errorMessage);
    }
  }

  /*
   * Stop processing a job
   */
  async cancelJob(job) {
    try {
      await job.fsm.cancel();
      await this.app.context.bot.stopJob(job);
      await job.stopwatch.stop();
      await job.fsm.cancelDone();
    } catch (ex) {
      const errorMessage = `Job stop failure ${ex}`;
      this.logger.error(errorMessage);
      await job.fsm.cancelFail();
    }
  }
}

module.exports = Jobs;
