const request = require('request-promise');
const { scrapeDraftPageData } = require('../../lib/htmlScraper');

const createPfrUrl = (year) => {
  return `https://www.pro-football-reference.com/years/${year}/draft.htm`
};

const getDraftData = async (year) => {
  const webpageUrl = createPfrUrl(year);

  return request(webpageUrl)
    .then(html => scrapeDraftPageData(html, year))
    .catch(ex => console.log(ex));
}


const getDraftHistory = async (startYear, endYear = 2020) => {
  if (endYear > new Date().getFullYear()) {
    throw new Error('Year cannot be in the future');
  }

  const draftDataPromises = [];

  for (let year = startYear; year <= endYear; year++) {
    draftDataPromises.push(getDraftData(year));
  }

  return Promise.all(draftDataPromises);
}

module.exports = {
  getDraftHistory,
}
