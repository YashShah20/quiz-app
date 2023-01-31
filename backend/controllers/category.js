const pool = require("../connection");
const jwt = require("jsonwebtoken");
const { JWT_SECRET } = require("../config");
const adminAuth = (req, res, next) => {
  try {
    const { token } = req.headers;
    if (!token) {
      return res.status(403).json({ error: "auth failed" });
    }
    const user = jwt.verify(token, JWT_SECRET);

    if (!user || user.role != 3) {
      return res.status(403).json({ error: "admin rights required" });
    }

    req.user = user;
    next();
  } catch (error) {
    console.log(error);
  }
};
const userAuth = (req, res, next) => {
  try {
    const { token } = req.headers;
    const user = jwt.verify(token, JWT_SECRET);

    if (!user) {
      return res.status(403).json({ error: "login required" });
    }

    req.user = user;
    next();
  } catch (error) {
    console.log(error);
  }
};

exports.getCategories = [
  adminAuth,
  async (req, res) => {
    try {
      let query = "select * from category order by category_id";
      if (req.user.role === 3) {
        query = `select category.*,(select count(*) from questions where category_id=category.category_id) from category order by category_id`;
      }
      const categories = await pool.query(query);
      res.json({ categories: categories.rows });
    } catch (error) {
      console.log(error);
    }
  }
];
exports.getCategoryById = [
  adminAuth,
  async (req, res) => {
    try {
      const { id } = req.params;
      const categories = await pool.query(
        "select * from category where category_id=$1",
        [id]
      );
      res.json({ categories: categories.rows });
    } catch (error) {
      console.log(error);
    }
  }
];
exports.addCategory = [
  adminAuth,
  async (req, res) => {
    try {
      const { name } = req.body;

      const result = await pool.query(
        "insert into category (name) values ($1) returning *",
        [name]
      );

      res.json(result.rows);
    } catch (error) {
      console.log(error);
    }
  }
];
exports.updateCategory = [
  adminAuth,
  async (req, res) => {
    try {
      const { name } = req.body;
      const { id } = req.params;

      const result = await pool.query(
        "update category set name=$1 where category_id=$2 returning *",
        [name, id]
      );

      res.json(result.rows);
    } catch (error) {
      console.log(error);
    }
  }
];
exports.deleteCategory = [
  adminAuth,
  async (req, res) => {
    try {
      const { id } = req.params;

      const options_results = await pool.query(
        "delete from questions where category_id=$1 returning *",
        [id]
      );
      const result = await pool.query(
        "delete from category where category_id=$1 returning *",
        [id]
      );

      res.json(result.rows);
    } catch (error) {
      console.log(error);
    }
  }
];
