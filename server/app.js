const express = require("express");
const app = express();

const port = process.env.PORT || 3000;
const socket_io_port = 3001;

const mainRouter = require("./router/mainRouter.js");
const authRouter = require("./router/authRouter.js");
const searchRouter = require("./router/searchRouter.js");
const cors = require("cors");
const path = require("path");

// ws:로 들어온다.
// 바로 객체 생성
const io = require("socket.io")();
io.listen(socket_io_port);

// const io = new socket(socket_io_port);
//io에 emit을 하면 연결 끊어진 애들도 다 받는것.
// 아래서 socket에 보내면 연결된 애들만 보내는 것.
io.on("connection", socket => {
  console.log("connect");
  // emit은 연결된 전체에게 보내기
  socket.emit("data", { key: 123 });
  socket.emit(
    "loginImgSrc",
    "https://cdn.pixabay.com/photo/2023/10/30/18/59/pumpkins-8353576_1280.jpg"
  );
});

app.use(cors());
// 기본은 form-data 형태로 간다.
app.use(express.json()); /// application/json

/// URLENCODED 데이터
// app.use(express.urlencoded()); // xxx urlencoded

app.use(express.static("public"));

// app.use((req, res, next) => {
//   req.io = io;
//   next();
// });

app.get("/", (req, res) => {
  res.sendFile(__dirname + "/public/index.html");
});

app.get("/admin", (req, res) =>
  res.sendFile(path.join(__dirname, "./pages/admin.html"))
);

app.get("/imgSrc", (req, res) => {
  const { input } = req.query;

  io.emit("loginImgSrc", input);
  res.json("OK");
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
