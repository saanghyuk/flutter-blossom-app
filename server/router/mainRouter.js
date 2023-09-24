const express = require("express");
const router = express.Router();
const mainController = require("../controller/mainController");

const userCheck = (req, res, next) => {
  console.log("USERCHECK");
  // 모든 페이지 요청에서 유효 토큰인지 확인
  // res.json("CHECK")
  // 토큰 받아서 정상적인 요청인지를 볼 것;
  next();
};

router.post("/", [userCheck], mainController.home);

module.exports = router;
