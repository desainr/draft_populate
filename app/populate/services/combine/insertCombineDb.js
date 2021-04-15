const { pg, client } = require('../../../lib/db');

const insertCombineStats = (combineObjs) => {
  console.log(`Inserting ${combineObjs.length} new entries to combine_stats`);

  const columnSet = new pg.helpers.ColumnSet(['player_id', 'height', 'weight', 'wonderlic', 'forty_time',
    'bench_press', 'vert_leap', 'broad_jump', 'shuttle', 'three_cone'], {table: 'combine_stats'})

  const query = () => pg.helpers.insert(combineObjs, columnSet);

  return client.none(query);
};

module.exports = {
  insertCombineStats,
}
