const { getDraftHistory } = require('./draft/getDraftHistory');
const { insertDrafts, insertPlayers } = require('./draft/insertDraftData');
const { generateCombineDataByYear } = require('./combine/generateCombineData');

const populateDraftsAndPlayers = async (startYear, endYear) => {
   const draftHistoryData = await getDraftHistory(startYear, endYear);

   console.log(`Finished parsing draft history data. ${draftHistoryData.length} draft years parsed.`)

   for (const draftYearData of draftHistoryData) {
     await insertPlayers(draftYearData.playerData);
     await insertDrafts(draftYearData.draftData);
   }

   console.log(`Finished writing new players and drafts to database.`);
}

const populateCombines = async (startYear, endYear) => {
  for (let year = startYear; year <= endYear; year++) {
    await generateCombineDataByYear(year)
  }
}

module.exports = {
  populateCombines,
  populateDraftsAndPlayers,
}
