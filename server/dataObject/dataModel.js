const { MainDataModel } = require("./mainDataModel");

/// @ 문서로 ... 작성 필요 ...
class DataModel_Abstract {
  constructor({ code, body }) {
    // code 숫자 인지? + 200, 300, 400
    //
    // body
    // MainDataModel ? AuthDataModel
    this.code = code;
    this.body = body;
  }
}

DataModel_Abstract.prototype.mainData = (code, json) => {
  return new DataModel_Abstract({
    code,
    body: json.map(e => MainDataModel.prototype.json(e))
  });
};

module.exports = { DataModel_Abstract };
