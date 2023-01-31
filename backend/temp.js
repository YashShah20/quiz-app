const { data } = require("./data");

data.map((item, index) => {
  const question_query = `insert into questions (id,question,type,difficulty,category_id) values (${index +
    1},'${item.question}','${item.type}',${item.difficulty},${
    item.categoryId
  });`;
  console.log(question_query);

  const correct_answer_query = `insert into options (question_id,option,is_correct) values (${index +
    1},'${item.correct_answer}',true);`;
  console.log(correct_answer_query);

  item.incorrect_answers.map(option => {
    let incorrect_answer_query = `insert into options (question_id,option,is_correct) values (${index +
      1},'${option}',false);`;
    console.log(incorrect_answer_query);
  });
});
