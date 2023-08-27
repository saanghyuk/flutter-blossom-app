const express = require("express");
const router = express.Router();
const mainController = require("../controller/mainController");

const userCheck = (req, res, next) => {
  console.log("USERCHECK");
  //
  // res.json("CHECK")
  // 토큰 받아서 정상적인 요청인지를 볼 것;
  next();
};

router.post("/", [userCheck], mainController.home);

module.exports = router;
