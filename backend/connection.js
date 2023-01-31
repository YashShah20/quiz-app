const { db } = require("./config");
const Pool = require("pg").Pool;

// console.log(db);
const pool = new Pool(db);

module.exports = pool;
