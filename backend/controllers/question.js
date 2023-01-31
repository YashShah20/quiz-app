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
    console.log(error.message);
  }
};

exports.getQuestionsByCategory = [
  adminAuth,
  async (req, res) => {
    const { cid } = req.params;

    const questions = await pool.query(
      "select id,question,type,difficulty,(select option from options where question_id=questions.id and options.is_correct=true) as answer,(select string_agg(option,'|') from options where question_id=questions.id) as options,(select name from category where category_id=questions.category_id) as category from questions where category_id=$1",
      [cid]
    );

    res.json({ questions: questions.rows });
  }
];

// request body
// {
//   categoryId: 1,
//   type: "multiple",
//   difficulty: 1, // [easy:1,medium:2,hard:3]
//   question: "Which 80s band is fronted by singer/guitarist Robert Smith?",
//   correct_answer: "The Cure",
//   incorrect_answers: ["The Smiths", "Echo &amp; the Bunnymen", "New Order"]
// }

exports.addSingleQuestion = [
  adminAuth,
  async (req, res) => {
    try {
      // const { cid } = req.params;
      const {
        categoryId,
        question,
        correct_answer,
        incorrect_answers,
        type,
        difficulty
      } = req.body;

      console.log(req.params, req.body);
      const questions_results = await pool.query(
        "insert into questions (question,type,difficulty,category_id) values ($1,$2,$3,$4) returning *",
        [question, type, difficulty, categoryId]
      );

      const question_id = questions_results.rows[0].id;

      const correct_answer_results = await pool.query(
        "insert into options (question_id,option,is_correct) values ($1,$2,$3) returning *",
        [question_id, correct_answer, true]
      );

      incorrect_answers.map(async option => {
        const incorrect_answers_results = await pool.query(
          "insert into options (question_id,option,is_correct) values ($1,$2,$3) returning *",
          [question_id, option, false]
        );
      });
      console.log(question_id);

      res.json({ question: questions_results.rows });
    } catch (error) {
      console.log(error.message);
    }
  }
];
exports.addBulkQuestions = [
  adminAuth,
  (req, res) => {
    try {
      req.body.questions.map(async single_question => {
        const {
          categoryId,
          question,
          correct_answer,
          incorrect_answers,
          type,
          difficulty
        } = single_question;

        console.log(single_question);
        const questions_results = await pool.query(
          "insert into questions (question,type,difficulty,category_id) values ($1,$2,$3,$4) returning *",
          [question, type, difficulty, categoryId]
        );

        const question_id = questions_results.rows[0].id;

        const correct_answer_results = await pool.query(
          "insert into options (question_id,option,is_correct) values ($1,$2,$3) returning *",
          [question_id, correct_answer, true]
        );

        incorrect_answers.map(async option => {
          const incorrect_answers_results = await pool.query(
            "insert into options (question_id,option,is_correct) values ($1,$2,$3) returning *",
            [question_id, option, false]
          );
        });
      });

      res.json({ msg: "bulk data added" });
    } catch (error) {
      console.log(error.message);
    }
  }
];
exports.updateQuestion = [
  adminAuth,
  async (req, res) => {
    try {
      const {
        categoryId,
        question,
        correct_answer,
        incorrect_answers,
        type,
        difficulty
      } = req.body;

      const { qid } = req.params;
      const updated_question = await pool.query(
        "update questions set category_id=$1,question=$2,type=$3,diffficulty=$4 where id=$5",
        [categoryId, question, type, difficulty, id]
      );

      const updated_correct_answer = await pool.query(
        "update options set option=$1 where is_correct=true",
        [correct_answer]
      );

      res.json({ results: updated_question.rows });
    } catch (error) {
      console.log(error.message);
    }
  }
];
exports.deleteQuestion = [
  adminAuth,
  async (req, res) => {
    try {
      const { qid } = req.params;

      const question_results = await pool.query(
        "delete from questions where id=$1",
        [qid]
      );

      res.json({ results: question_results.rows });
    } catch (error) {
      console.log(error.message);
    }
  }
];
