const bodyParser = require("body-parser");
const express = require("express");

const jwt = require("jsonwebtoken");

const authRouter = require("./routes/auth");
const categoryRouter = require("./routes/category");
const userRouter = require("./routes/user");
const questionRouter = require("./routes/question");
const quizRouter = require("./routes/quiz");
const cors = require("cors");
const app = express();

app.use(cors());
app.use(bodyParser.json());

app.use("/auth", authRouter);
app.use("/category", categoryRouter);
app.use("/user", userRouter);
app.use("/", questionRouter);
app.use("/quiz", quizRouter);

const port = 3000;

app.listen(port, () => {
  console.log(`server is running at ${port}`);
});
