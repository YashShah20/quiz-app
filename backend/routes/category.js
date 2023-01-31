const express = require("express");
const router = express.Router();
const {
  getCategories,
  getCategoryById,
  updateCategory,
  deleteCategory,
  addCategory
} = require("../controllers/category");

router.get("/", getCategories);
router.get("/:id", getCategoryById);

router.post("/add", addCategory);
router.put("/:id", updateCategory);
router.delete("/:id", deleteCategory);

module.exports = router;
