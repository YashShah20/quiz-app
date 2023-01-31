<template>
  <div class="container mt-5">
    <!-- Full screen modal -->
    <div class="alert alert-danger text-center" v-if="error.code == 1">
      <p>{{ error.msg }}</p>
    </div>
    <div v-else class="d-flex flex-nowrap">
      <div class="w-25 m-1">
        <ul class="list-group">
          <li class="list-item mb-2">
            <router-link to="/category"> Back </router-link>
          </li>
          <li class="list-item mb-4">
            <router-link to="questions/add">
              Add new Questions
            </router-link>
          </li>
          <li
            class="list-item mb-2"
            v-for="category in categoryListWithURL"
            @click="
              $router.push(category.url);
              loadData();
            "
          >
            <span
              class="text-primary "
              :to="category.url"
              :class="{ 'text-success active': category.category_id == cid }"
            >
              {{ category.name }}
            </span>
          </li>
        </ul>
      </div>
      <div class="w-100 m-1">
        <div
          class="alert alert-danger text-capitalize text-center"
          v-if="transformedQuestionList.length === 0"
        >
          questions not found
        </div>
        <div
          class="card mb-3"
          v-for="(question, index) in transformedQuestionList"
        >
          <div class="card-body bg">
            <h5 class="card-title d-inline-block">
              <span class=""> {{ index + 1 }}.</span>
              <span v-html="question.question"></span>
            </h5>
            <span
              class="text-danger float-end"
              :id="question.id"
              @click="deleteQuestion"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="16"
                :id="question.id"
                height="16"
                fill="currentColor"
                class="bi bi-trash3-fill"
                viewBox="0 0 16 16"
              >
                <path
                  :id="question.id"
                  d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"
                />
              </svg>
            </span>
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
              <li class="list-group-item" v-for="option in question.options">
                <div class="form-check">
                  <input class="form-check-input" type="radio" :name="index" />
                  <label class="form-check-label" v-html="option"> </label>
                  <span
                    class="mx-2 text-success"
                    v-if="option == question.answer"
                  >
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      fill="currentColor"
                      class="bi bi-check-circle-fill"
                      viewBox="0 0 16 16"
                    >
                      <path
                        d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"
                      />
                    </svg>
                  </span>
                </div>
              </li>
            </ol>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      error: {
        code: 0,
        msg: ""
      },
      cid: 0,
      questionList: [],
      categoryList: []
    };
  },
  created() {
    this.loadData();
    this.$http
      .get(`http://localhost:3000/category/`, {
        headers: {
          token: localStorage.token
        }
      })
      .then(res => {
        console.log(res.body);
        this.categoryList = res.body.categories;
      })
      .catch(error => {
        this.error = {
          code: 1,
          msg: error.body.error
        };
        console.log(error.body);
      });
  },
  methods: {
    deleteQuestion: function(event) {
      const cid = this.cid;
      const qid = event.target.id;
      console.log(qid);

      this.$http
        .delete(`http://localhost:3000/category/${cid}/questions/${qid}`, {
          headers: {
            token: localStorage.token
          }
        })
        .then(res => {
          console.log(res.body);
          this.questionList = this.questionList.filter(question => {
            return question.id != qid;
          });
        })
        .catch(error => {
          this.error = {
            code: 1,
            msg: error.body.error
          };
          console.log(error.body);
        });
    },
    loadData: function() {
      const { cid } = this.$route.params;
      this.cid = cid;
      this.$http
        .get(`http://localhost:3000/category/${cid}/questions/`, {
          headers: {
            token: localStorage.token
          }
        })
        .then(res => {
          console.log(res.body);
          this.questionList = res.body.questions;
        })
        .catch(error => {
          this.error = {
            code: 1,
            msg: error.body.error
          };
          console.log(error.body);
        });
    }
  },
  computed: {
    transformedQuestionList: function() {
      return this.questionList.map(question => {
        try {
          question.options = question.options.split("\|");
        } catch (error) {}
        return question;
      });
    },
    categoryListWithURL: function() {
      return this.categoryList.map(category => {
        category.url = `/category/${category.category_id}/questions`;
        return category;
      });
    }
  },
  watch: {
    cid: function() {
      this.loadData();
    }
  }
};
</script>
<style scoped>
ul {
  list-style-type: none;
}
a,
router-link {
  outline: none;
}
svg path,
li span {
  cursor: pointer;
}
</style>
