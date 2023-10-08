class SearchDataModel {
  constructor({ id, title, imgSrc }) {
    (this.id = id), (this.title = title), (this.imgSrc = imgSrc);
  }
}

SearchDataModel.prototype.json = json => {
  return new SearchDataModel(json);
};

module.exports = { SearchDataModel };
