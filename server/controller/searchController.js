const { DataModel_Abstract } = require("../dataObject/dataModel");

const data = [
  {
    id: "pId",
    title: "searchResult",
    imgSrc: ""
  }
];

class SearchController {
  search = (req, res) => {
    const { q } = req.body;
    console.log(q);
    res.json(DataModel_Abstract.prototype.searchData(200, data));
  };
}

module.exports = new SearchController();
