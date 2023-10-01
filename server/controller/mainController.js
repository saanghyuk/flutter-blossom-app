const { DataModel_Abstract } = require("../dataObject/dataModel");

// import { DataModel_Abstract } from "../dataObject/dataModel";
// import {
//   MainDataModel,
//   MainDataTitleModel,
//   MainDataDesModel
// } from "../dataObject/mainDataModel";

const dummy = [
  {
    lan: "KO",
    id: "uid-0",
    c_date: "2023-09-28",
    title: {
      txt: "title",
      image:
        "https://firebasestorage.googleapis.com/v0/b/blossom-95253.appspot.com/o/test.png?alt=media&token=f0e9dbf6-871c-4f81-a8d1-3ba863749baa&_gl=1*e15rmj*_ga*MjgyMDA1MTUwLjE2OTI1MDc3Mzg.*_ga_CW55HF8NVT*MTY5NTg4MDE1MC4zMC4xLjE2OTU4ODA0NzMuMzIuMC4w",
      subTitle: "title_sub"
    },
    des: {
      type: "",
      des: "",
      images: [
        "https://firebasestorage.googleapis.com/v0/b/blossom-95253.appspot.com/o/boy-8235025_1280.png?alt=media&token=73c9f9d7-6bd5-4c31-9f7f-08ec285cea65&_gl=1*1n7yegq*_ga*MjgyMDA1MTUwLjE2OTI1MDc3Mzg.*_ga_CW55HF8NVT*MTY5NTg4MDE1MC4zMC4xLjE2OTU4ODA2MTguNDcuMC4w"
      ]
    },
    f_count: 10,
    s_count: 20,
    active: true,
    a_date: ""
  }
];

class MainController {
  home = (req, res) => {
    // let {// 로그를 위한 데이터를 보통 } = req.body;
    const data = DataModel_Abstract.prototype.mainData(200, dummy);
    // print(data);
    res.json(data);
  };
}

module.exports = new MainController();
