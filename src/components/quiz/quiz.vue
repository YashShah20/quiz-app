<template>
  <div class="container mt-5">
    <template v-if="quizSubmitted">
      <div class="text-center h2">
        Your Score: <span>{{ score }}/15</span>
      </div>
    </template>
    <template v-else-if="quizStarted">
      <div class="d-flex flex-row">
        <div class="w-100 m-1">
          <form @submit.prevent="submitQuiz" v-if="questionList.length > 0">
            <div class="card mb-3" v-for="(question, index) in questionList">
              <div class="card-body bg">
                <h5 class="card-title d-inline-block">
                  <span class=""> {{ index + 1 }}.</span>
                  <span v-html="question.question"></span>
                </h5>

                <span
                  class="badge mx-2"
                  v-html="
                    question.difficulty == 3
                      ? 'hard'
                      : question.difficulty == 2
                      ? 'medium'
                      : 'easy'
                  "
                  :class="{
                    'text-bg-danger': question.difficulty == '3',
                    'text-bg-warning': question.difficulty == '2',
                    'text-bg-success': question.difficulty == '1'
                  }"
                >
                </span>
                <ol class="list-group list-group-flush">
                  <li
                    class="list-group-item"
                    v-for="(option, id) in question.options"
                  >
                    <div class="form-check">
                      <label class="form-check-label" :for="index * 10 + id">
                        <span v-html="option"></span>
                        <input
                          class="form-check-input"
                          type="radio"
                          :name="index"
                          :id="index * 10 + id"
                          @change="question.selectedOption = option"
                        />
                      </label>
                    </div>
                  </li>
                  <!-- <li class="list-group-item">
                    <b>You Selected:</b>
                    <span v-html="question.selectedOption"></span>
                  </li> -->
                </ol>
              </div>
            </div>
            <div>
              <button class="btn btn-primary mb-3">Submit</button>
            </div>
          </form>
          <template v-else>
            <div class="alert alert-danger text-capitalize text-center h3">
              quiz not available
            </div>
            <router-link to="/home">
              back to home
            </router-link>
          </template>
        </div>
      </div>
    </template>
    <template v-else>
      <div class="row h5">
        <div class="mb-2 col col-12"><b>Username:</b> {{ user.name }}</div>
        <div class="mb-2 col col-12"><b>Quiz Categoty ID:</b> {{ cid }}</div>
        <div class="mb-2 col col-12"><b>Total Questions:</b> {{questionList.length}}</div>
      </div>
      <button class="btn btn-primary" @click="startQuiz">
        Start Quiz
      </button>
    </template>
  </div>
</template>
<script>
export default {
  data() {
    return {
      cid: -1,
      questionList: [],
      quizStarted: false,
      quizSubmitted: false,
      user: {},
      score: 0
    };
  },
  created() {
    this.cid = this.$route.params.cid;
    const cid = this.cid;

    let quizURL = "";
    if (this.cid < 1) {
      quizURL = `http://localhost:3000/quiz/random`;
    } else {
      quizURL = `http://localhost:3000/quiz/${cid}`;
    }

    this.$http
      .get(quizURL, {
        headers: {
          token: localStorage.token
        }
      })
      .then(res => {
        console.log(res.body);
        this.user = res.body.user;
        this.questionList = res.body.questions.map(question => {
          question.options = question.options.split("|");
          question.selectedOption = "";
          return question;
        });
      })
      .catch(error => {
        console.log(error.body);
      });
  },
  methods: {
    startQuiz: function() {
      this.quizStarted = true;
    },
    submitQuiz: function() {
      console.log(this.questionList);
      const cid = this.$route.params.cid;

      this.$http
        .post(
          `http://localhost:3000/quiz/${cid}`,
          {
            questions: this.questionList,
            user: this.user,
            categoryId: this.cid
          },
          {
            headers: {
              token: localStorage.token
            }
          }
        )
        .then(res => {
          console.log(res.body);
          this.score = res.body.result;
        })
        .catch(error => {
          console.log(error.body);
        });
      this.quizSubmitted = true;
    }
  }
};
</script>
<style scoped>
.divider {
  border: 2px dashed lightgrey;
}
</style>
