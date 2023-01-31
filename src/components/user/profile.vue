<template>
  <div class="container mt-5">
    <div class="alert alert-danger text-center" v-if="error.code > 0">
      <p>{{ error.msg }}</p>
    </div>
    <div v-else>
      <div class="mb-3">
        <b><label for="">Name:</label></b>
        <span>{{ user.name }}</span>
        <br />

        <b><label for="">Role:</label></b>
        <span>{{ user.role === 3 ? "admin" : "user" }}</span>
        <br />
      </div>

      <div class="mb-3" v-if="user.role === 3">
        <router-link class="btn btn-primary" to="/category"
          >Manage Categories</router-link
        >
      </div>
      <div class="h5 mb-3">
        Numbers of quiz participated:
        {{ participatedQuizzes.length }}
      </div>

      <table class="table table-bordered">
        <caption class="h4" style="caption-side: top;text-align: center;">
          Past quizzes
        </caption>
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Category</th>
            <th scope="col">Day</th>
            <th scope="col">Score</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(quiz, index) in participatedQuizzes">
            <th scope="row">{{ index + 1 }}</th>
            <td>{{ quiz.category }}</td>
            <td>{{ quiz.day.slice(0, 10) }}</td>
            <td>{{ quiz.score }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      user: {},
      error: {
        code: 0,
        msg: ""
      },
      participatedQuizzes: []
    };
  },
  created() {
    this.$http
      .get(`http://localhost:3000/user/profile`, {
        headers: {
          token: localStorage.token
        }
      })
      .then(res => {
        this.user = res.body.user;
        this.participatedQuizzes = res.body.participatedQuizzes;
      })
      .catch(error => {
        this.error = {
          code: 1,
          msg: error.body.error
        };
        console.log(error.body);
      });
  }
};
</script>
<style scoped></style>
