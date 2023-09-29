const { json } = require("express");

class MainDataModel {
  constructor({
    lan,
    id,
    c_date,
    title,
    des,
    f_count,
    s_count,
    active,
    a_date
  }) {
    if (!title instanceof MainDataTitleModel)
      throw "type err - MainDataTitleModel";
    if (!des instanceof MainDataDesModel) throw "type err - MainDataDesModel";
    this.lan = lan;
    this.id = id;
    this.c_date = c_date;
    this.title = title;
    this.des = des;
    this.f_count = f_count;
    this.s_count = s_count;
    this.active = active;
    this.a_date = a_date;
  }
}

MainDataModel.prototype.json = json => {
  return new MainDataModel({
    title: MainDataTitleModel.prototype.json(json.title),
    des: MainDataDesModel.prototype.json(json.des),
    lan: json.lan,
    id: json.id,
    c_date: json.c_date,
    f_count: json.f_count,
    s_count: json.s_count,
    active: json.active,
    a_date: json.a_date
  });
};

class MainDataTitleModel {
  constructor({ txt, image, subTitle }) {
    this.txt = txt;
    this.image = image;
    this.subTitle = subTitle;
  }
}

MainDataTitleModel.prototype.json = json => {
  return new MainDataTitleModel(json);
};

class MainDataDesModel {
  constructor({ des, images, type }) {
    this.des = des;
    this.type = type; // 단순 텍스트인지, 이미지인지, 영상인지
    if (!Array.isArray(images)) throw "type err Array<String>";
    console.log(images);
    images.forEach(e => {
      if (typeof e !== "string") throw "type err - ele String";
    });
    // + validation e - https://
    this.image = images;
  }
}

MainDataDesModel.prototype.json = json => {
  return new MainDataDesModel(json);
};

module.exports = { MainDataModel, MainDataTitleModel, MainDataDesModel };
