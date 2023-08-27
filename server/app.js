const express = require("express");
const app = express();

const port = process.env.PORT || 3000;

const mainRouter = require("./router/mainRouter.js");

app.use(express.json());
// app.get("/", (req, res) => {});

app.use("/main", mainRouter);

// 서버보내는 모든 요청 다 받는 것
// 위에서 매칭이 안됬을 때 받는 것.
app.use("*", (req, res) => res.json("ok"));

app.listen(port);
