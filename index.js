const {populateDraftsAndPlayers, populateCombines} = require('./app/populate')

const runPopulate = async () => {
  await populateDraftsAndPlayers(2000, 2020);
  await populateCombines(2000, 2020)
};

runPopulate();
