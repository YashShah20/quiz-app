const { JWT_SECRET } = require("../config");
const pool = require("../connection");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

exports.signin = [
  async (req, res) => {
    const { name, password } = req.body;
    // check whether user is there or not
    const user = await pool.query("select * from users where name=$1", [name]);

    if (!user || user.rowCount == 0) {
      return res.status(403).json({ error: "invalid credentials" });
    }

    // verify password
    const matchedPassword = await bcrypt.compare(
      password,
      user.rows[0].password
    );

    if (!matchedPassword) {
      return res.status(403).json({ error: "invalid credentials" });
    }

    // generate token
    const token = jwt.sign(
      { name: user.rows[0].name, role: user.rows[0].role, id: user.rows[0].id },
      JWT_SECRET
    );

    res.json({ user: user.rows[0], token: token });
  }
];

exports.signup = [
  // checking user not already exists
  async (req, res, next) => {
    try {
      const { name } = req.body;

      const existingUser = await pool.query(
        "select * from users where name=$1",
        [name]
      );

      // console.log(existingUser.rows);
      if (existingUser.rowCount > 0) {
        return res.status(400).json({ error: "user alredy exists" });
      } else {
        next();
      }
    } catch (error) {
      console.log(error);
    }
  },

  // adding user into database
  async (req, res) => {
    try {
      const { name, password, role } = req.body;

      // hash password
      const hashedPassword = await bcrypt.hash(password, 10);

      // add into database
      const user = await pool.query(
        "insert into users (name,password,role) values ($1,$2,$3) returning *",
        [name, hashedPassword, role]
      );

      if (user.rowCount == 1) {
        // generate token
        const token = await jwt.sign(
          {
            name: user.rows[0].name,
            role: user.rows[0].role,
            id: user.rows[0].id
          },

          JWT_SECRET
        );
        res.json({ user: user.rows, token });
      } else {
        res.json({ error: "something gone wrong..." });
      }
    } catch (error) {
      console.log(error);
    }
  }
];
