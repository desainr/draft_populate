const { pg, client } = require('../../../lib/db');

const insertPlayers = async (players) => {
  console.log(`Inserting ${players.length} new players...`);

  const columnSet = new pg.helpers.ColumnSet([
    'id', 'team_id', 'player', 'age', 'games', 'pass_cmp', 'pass_att', 'pass_tds',
    'pass_ints', 'rush_att', 'rush_yds', 'rush_tds', 'recs', 'rec_yds', 'rec_tds', 'tackles', 'def_ints',
    'sacks', 'pass_yds', 'position', 'last_active'], {table: 'players'})

  const query = () => pg.helpers.insert(players, columnSet);

  return client.none(query);
};

const insertDrafts = async (drafts) => {
  console.log(`Inserting ${drafts.length} new draft picks...`);

  const columnSet = new pg.helpers.ColumnSet(['player_id', 'team_id', 'pick', 'round', 'year'], {table: 'draft_picks'});

  const query = () => pg.helpers.insert(drafts, columnSet);

  return client.none(query);
};

module.exports = {
  insertDrafts,
  insertPlayers,
}
