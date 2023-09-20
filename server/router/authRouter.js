const express = require("express");
const router = express.Router();
const authController = require("../controller/authController");

/// 주소 이름과 컨트롤러 매칭만 시키는 역할을 함.
router.post("/", authController.login);
router.post("/check", authController.loginCheck);
module.exports = router;
