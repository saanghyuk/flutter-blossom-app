const express = require("express");
const app = express();

const port = process.env.PORT || 3000;

const mainRouter = require("./router/mainRouter.js");
const authRouter = require("./router/authRouter.js");

// 기본은 form-data 형태로 간다.
app.use(express.json()); /// application/json
/// URLENCODED 데이터
// app.use(express.urlencoded()); // xxx urlencoded

// app.get("/", (req, res) => {});

app.use("/main", mainRouter);
app.use("/auth", authRouter);

// 서버보내는 모든 요청 다 받는 것
// 위에서 매칭이 안됬을 때 받는 것.
app.use("*", (req, res) => res.json("ok"));

app.listen(port);
