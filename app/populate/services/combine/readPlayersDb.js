const {client} = require('../../../lib/db');

const getPlayersByDraftYear = async (year) => {
  console.log(`Getting players from ${year} draft...`);

  const query = `SELECT p.id, p.player FROM players p JOIN draft_picks dp on p.id = dp.player_id WHERE dp.year = $1`;

  return client.query(query, [year]);
}

module.exports = {
  getPlayersByDraftYear,
}
