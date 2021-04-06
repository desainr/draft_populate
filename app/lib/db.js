const pg = require('pg-promise')({});
const config = require('../../localConfig.json');

const client = pg(config);

module.exports = {
  client,
  pg
};
