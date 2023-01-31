const express = require("express");
const router = express.Router();

const { home, profile } = require("../controllers/user");

router.get("/home", home);
router.get("/profile", profile);

module.exports = router;
