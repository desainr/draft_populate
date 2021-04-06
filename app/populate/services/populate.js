const { getDraftHistory } = require('./getDraftHistory');
const { insertDrafts, insertPlayers } = require('./insertDraftData');

const populate = async (startYear, endYear) => {
   const draftHistoryData = await getDraftHistory(2020);

   console.log(draftHistoryData);
   for (const draftYearData of draftHistoryData) {
     await insertPlayers(draftYearData.playerData);
     await insertDrafts(draftYearData.draftData);
   }
}

module.exports = populate;
