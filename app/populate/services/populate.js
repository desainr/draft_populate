const { getDraftHistory } = require('./getDraftHistory');
const { insertDrafts, insertPlayers } = require('./insertDraftData');

const populate = async (startYear, endYear) => {
   const draftHistoryData = await getDraftHistory(startYear, endYear);

   console.log(`Finished parsing draft history data. ${draftHistoryData.length} draft years parsed.`)

   for (const draftYearData of draftHistoryData) {
     await insertPlayers(draftYearData.playerData);
     await insertDrafts(draftYearData.draftData);
   }

   console.log(`Finished writing new players and drafts to database.`);
}

module.exports = populate;
