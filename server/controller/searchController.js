const { DataModel_Abstract } = require("../dataObject/dataModel");

const data = [
  {
    id: "pId1",
    title: "searchResult",
    imgSrc:
      "https://cdn.pixabay.com/photo/2023/09/25/20/11/boat-8275962_1280.jpg"
  },
  {
    id: "pId2",
    title: "searchResult",
    imgSrc:
      "https://cdn.pixabay.com/photo/2023/10/15/18/12/swan-8317602_1280.jpg"
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
