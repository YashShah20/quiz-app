const jwt = require("jsonwebtoken");
const { JWT_SECRET } = require("../config");
const pool = require("../connection");

const userAuth = (req, res, next) => {
  const { token } = req.headers;

  if(!token) {
    return res.status(403).json({ error: "auth failed" });
  }
  const user = jwt.verify(token, JWT_SECRET);

  if (user) {
    req.user = user;
    next();
  } else {
    return res.status(403).json({ error: "auth failed" });
  }
};

exports.home = [
  userAuth,
  async (req, res) => {
    try {
      const categories = await pool.query(
        "select * from category order by category_id"
      );
      res.json({ user: req.user, categories: categories.rows });
    } catch (error) {
      console.log(error);
    }
  }
];

exports.profile = [
  userAuth,
  async (req, res) => {
    try {
      const { name } = req.user;

      const participatedQuizzes = await pool.query(
        "select id,(select name from users where users.name=quizes.user_name) as username,(select name from category where category_id=quizes.category_id) as category,day,score from quizes where user_name=$1",
        [name]
      );

      res.json({
        user: req.user,
        participatedQuizzes: participatedQuizzes.rows
      });
    } catch (error) {
      console.log(error);
    }
  }
];
