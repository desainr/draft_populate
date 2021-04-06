const pg = require('pg-promise')({});
const config = require('../../sqlConfig.json');

const client = pg(config.connectionString);

module.exports = {
  client,
  pg
};
