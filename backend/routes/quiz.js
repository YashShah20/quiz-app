const express = require("express");
const jwt = require("jsonwebtoken");
const { JWT_SECRET } = require("../config");
const router = express.Router();
const {
  quizOnCategory,
  randomQuiz,
  submitQuiz,
  quizResult
} = require("../controllers/quiz");

router.use((req, res, next) => {
  try {
    const { token } = req.headers;
    if (!token) {
      return res.status(403).json({ error: "auth failed" });
    }
    const user = jwt.verify(token, JWT_SECRET);

    if (!user) {
      return res.status(403).json({ error: "login required" });
    }

    req.user = user;
    next();
  } catch (error) {
    console.log(error);
  }
});

router.get("/random", randomQuiz);
router.get("/:cid", quizOnCategory);

router.post("/:cid", submitQuiz);

router.get("/result", quizResult);

module.exports = router;
