<template>
  <div class="container mt-5">
    <div class="alert alert-danger text-center" v-if="error.code>0">
      {{ error.msg }}
    </div>
    <template v-else>
      <div class="text-end">
        <router-link
          :to="'/category/' + $route.params.cid + '/questions'"
          class="btn btn-primary"
          >back
        </router-link>
      </div>
      <br /><br />
      <!-- <br> -->
      <div class="d-flex flex-row justify-content-around">
        <div>
          <span class="h4"> Add Single Question</span>
          <form class="form mt-3" @submit.prevent="addSingleQuestion">
            <div>
              <label>Question</label>
              <textarea
                class="form-control"
                style="width: 25vw;"
                v-model="question.question"
              ></textarea>
            </div>
            <div class="row">
              <div class="col">
                <label>Type</label>
                <select class="form-select" v-model="question.type">
                  <option class="select-item" value="multiple">multiple</option>
                  <option class="select-item" value="boolean"
                    >true-false</option
                  >
                </select>
              </div>
              <div class="col">
                <label>Difficulty</label>
                <select class="form-select" v-model="question.difficulty">
                  <option class="select-item" value="1">easy</option>
                  <option class="select-item" value="2">medium</option>
                  <option class="select-item" value="3">hard</option>
                </select>
              </div>
            </div>
            <div>
              <label for="">Answer</label>
              <input
                type="text"
                class="form-control"
                v-model="question.correct_answer"
              />
            </div>
            <div>
              <label for="">Other options</label>
              <input
                type="text"
                class="form-control"
                v-for="i in optionsCount"
                v-model="question.incorrect_answers[i - 1]"
              />
            </div>
            <div>
              <button class="btn btn-primary mt-3">
                Add
              </button>
            </div>
          </form>
        </div>
        <div class="mx-5" style="border: 2px dashed;"></div>
        <div>
          <span class="h4">Add Bulk Questions</span>
          <form class="form mt-3" @submit.prevent="addBulkData">
            <div>
              <label for=""
                >Import from file
                <span
                  class="text-danger"
                  style="font-size: small; text-transform: lowercase;"
                  >(will be done in future)</span
                >
              </label>

              <input
                class="form-control form-control-sm"
                id="formFileSm"
                type="file"
              />
            </div>
            <div class="text-center hr text-secondary">
              or
            </div>
            <div>
              <label for="">Paste JSON</label>
              <textarea
                class="form-control"
                style="width: 25vw; height: 20vh;"
                v-model="bulkQuestionsBody"
                placeholder="[ {question 1},{question 2}, ..... ]"
              ></textarea>
            </div>
            <div>
              <button class="btn btn-primary mt-3">Add</button>
            </div>
          </form>
        </div>
      </div>
      <br /><br />
    </template>
  </div>
</template>
<script>
export default {
  data() {
    return {
      cid: 0,
      question: {
        categoryId: 0,
        question: "",
        type: "multiple",
        difficulty: 1,
        correct_answer: "",
        incorrect_answers: []
      },
      error: {
        code: 0,
        msg: ""
      },
      bulkQuestionsBody: []
    };
  },
  created() {
    this.cid = this.$route.params.cid;
    this.question.categoryId = this.cid;
  },
  computed: {
    optionsCount: function() {
      return this.question.type == "multiple" ? 3 : 1;
    }
  },
  methods: {
    addSingleQuestion: function() {
      const id = this.cid;
      console.log(JSON.stringify(this.question));
      this.$http
        .post(`http://localhost:3000/category/${id}/questions`, this.question, {
          headers: {
            token: localStorage.token
          }
        })
        .then(res => {
          console.log(res.body);
          // this.$router.replace(`/category/${id}/questions`);
        })
        .catch(error => {
          this.error = {
            code: 1,
            msg: error.body.error
          };
          console.log(res.body);
        });
    },
    addBulkData: function() {
      const id = this.cid;
      console.log(JSON.parse(this.bulkQuestionsBody));
      this.$http
        .post(
          `http://localhost:3000/category/${id}/questions/bulk`,
          {
            questions: JSON.parse(this.bulkQuestionsBody)
          },
          {
            headers: {
              token: localStorage.token
            }
          }
        )
        .then(res => {
          console.log(res.body);
          // this.$router.push(`/category/${id}/questions`);
        })
        .catch(error => {
          this.error = {
            code: 1,
            msg: error.body.error
          };
          console.log(res.body);
        });
    }
  }
};
</script>
<style scoped>
label {
  margin-bottom: 5px;
  text-transform: capitalize;
}
input,
textarea,
select {
  margin-bottom: 10px;
}

.hr::after,
.hr::before {
  content: "----------";
}
</style>
