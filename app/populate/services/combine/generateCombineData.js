const { getPlayersByDraftYear } = require('./readPlayersDb');
const request = require('request-promise');
const { insertCombineStats } = require('./insertCombineDb');
const { scrapeCombineDataMatchPlayers } = require('@desainr/htmlscraper');

const getCombineHtml = async (year) => {
  const combineResultsUrl = `https://nflcombineresults.com/nflcombinedata.php?year=${year}`

  return request(combineResultsUrl).catch(ex => {
    if (ex.statusCode === 404) {
      // for some reason the GET requests 404 but returns the html I want in the error...
      const errorHtml = ex.error;
      const indexOfHtmlStart = errorHtml.indexOf('<html');

      return errorHtml.substr(indexOfHtmlStart);
    } else {
      throw ex;
    }
  });
}

const generateCombineDataByYear = async (year) => {
  console.log(`Getting combine results for ${year}...`)

  // This unfortunately all has to be done synchronously.
  // Was getting some weird mysql timeout from the website when trying async.
  const html = await getCombineHtml(year);

  const players = await getPlayersByDraftYear(year)

  const {matchingPlayers, unmatchedPlayers} = scrapeCombineDataMatchPlayers(html, players);
  console.log(`Matched ${matchingPlayers.length}/${matchingPlayers.length + unmatchedPlayers.length} players`);
  console.log('Unmatched\n' + JSON.stringify(unmatchedPlayers));

  await insertCombineStats(matchingPlayers)
}

module.exports = {
  generateCombineDataByYear,
}
