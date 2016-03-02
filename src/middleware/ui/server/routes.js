const Promise = require(`bluebird`);
const getIp = Promise.promisifyAll(require(`ip`));

/**
 * Render the to-do list's documentation
 */
const getDocs = (self) => {
  self.router.get(self.routeEndpoint + '/docs', async (ctx) => {
    const docLocation = `middleware/docs.yaml`;
    const middlewareLocation = [docLocation]; // Not sure why this needs to be in an array

    ctx.render(`docs`, {
      title: `Hydra-Print Docs`,
      middlewareLocation,
    });
  });
};

/**
 * Render the app
 */
const getApp = (self) => {
  self.router.get(self.routeEndpoint, async (ctx) => {
    const ip = await getIp.address();
    const jobs = self.app.context.jobs.getJobs();
    const files = self.app.context.files.files;
    const clientState = self.app.context.bot.getBot().state;
    await ctx.render(`ui/index`, {
      title: `Hydra-Print`,
      clientState,
      jobs,
      files,
      ip,
    });
  });
};

const uiRoutes = (self) => {
  getDocs(self);
  getApp(self);
};

module.exports = uiRoutes;
