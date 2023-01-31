const express = require("express");
const router = express.Router();
const {
  getQuestionsByCategory,
  addSingleQuestion,
  addBulkQuestions,
  updateQuestion,
  deleteQuestion
} = require("../controllers/question");

router.get("/category/:cid/questions/", getQuestionsByCategory);
router.post("/category/:cid/questions/", addSingleQuestion);
router.post("/category/:cid/questions/bulk", addBulkQuestions);
router.put("/category/:cid/questions/:qid", updateQuestion);
router.delete("/category/:cid/questions/:qid", deleteQuestion);

module.exports = router;
