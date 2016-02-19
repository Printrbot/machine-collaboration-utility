const Sequelize = require('sequelize');

module.exports = async (app) => {
  // Define the model for a job
  const Job = await app.context.db.define('Job', {
    uuid: Sequelize.STRING,
    state: Sequelize.STRING,
    fileId: Sequelize.STRING,
    started: Sequelize.STRING,
    elapsed: Sequelize.STRING,
    percentComplete: Sequelize.FLOAT,
  });

  // Update the database tables to contain 'Task'
  await app.context.db.sync();
  return Job;
};
