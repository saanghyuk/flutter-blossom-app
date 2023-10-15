const express = require("express");
const app = express();

const port = process.env.PORT || 3000;

const mainRouter = require("./router/mainRouter.js");
const authRouter = require("./router/authRouter.js");
const searchRouter = require("./router/searchRouter.js");
const cors = require("cors");

app.use(cors());
// 기본은 form-data 형태로 간다.
app.use(express.json()); /// application/json

/// URLENCODED 데이터
// app.use(express.urlencoded()); // xxx urlencoded

app.use(express.static("public"));

app.get("/", (req, res) => {
  res.sendFile(__dirname + "/public/index.html");
});

app.get("/purchase-complete", (req, res) => {
  res.sendFile(path.join(__dirname, "public/purchase-complete.html"));
});

app.use("/main", mainRouter);
app.use("/auth", authRouter);
app.use("/search", searchRouter);

// 서버보내는 모든 요청 다 받는 것
// 위에서 매칭이 안됬을 때 받는 것.
app.use("*", (req, res) => res.json("ok"));

app.listen(port);
