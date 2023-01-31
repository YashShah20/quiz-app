const pool = require("../connection");

exports.quizOnCategory = async (req, res) => {
  try {
    const { cid } = req.params;

    const questions = await pool.query(
      "select questions.*,(select option from options where question_id=questions.id and is_correct=true) as answer,(select string_agg(option,'|') from options where question_id=questions.id) as options from questions TABLESAMPLE BERNOULLI (50) where category_id=$1 limit 15",
      [cid]
    );

    if (questions.rowCount < 15) {
      return res.status(404).json({ error: "not enough questions" });
    }
    console.log(req.user);
    res.json({ user: req.user, questions: questions.rows });
  } catch (error) {
    console.log(error.message);
  }
};

exports.submitQuiz = async (req, res) => {
  let score = 0;
  const { user, categoryId, questions } = req.body;
  questions.map(question => {
    if (question.answer == question.selectedOption) {
      score += 1;
    }
  });

  const results = await pool.query(
    `INSERT INTO public.quizes(
    user_name, category_id, score)
    VALUES ($1, $2, $3);`,
    [user.name, categoryId, score]
  );

  res.json({ result: score });
};

exports.randomQuiz = async (req, res) => {
  try {
    console.log("here");
    const questions = await pool.query(
      "select questions.*,(select option from options where question_id=questions.id and is_correct=true) as answer,(select string_agg(option,'|') from options where question_id=questions.id) as options from questions TABLESAMPLE SYSTEM (50) limit 15"
    );

    console.log(questions);
    res.json({ user: req.user, questions: questions.rows });
  } catch (error) {
    console.log(error.message);
  }
};
exports.quizResult = (req, res) => {
  res.json({ msg: "sign up requested" });
};
