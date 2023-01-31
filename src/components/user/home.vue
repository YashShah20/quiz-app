<template>
  <div class="container mt-5">
    <div class="alert alert-danger" v-if="error.code > 0">
      <p class="text-center">
        {{ error.msg }}
      </p>
    </div>
    <template v-else>
      <div class="text-center h1">Welcome, {{ user.name }}</div>
      <p class="text-center mb-5">Explore quizzes in following categories</p>
      <div class="d-flex flex-row flex-wrap  justify-content-center">
        <div
          class="p-2 btn btn-primary m-2 text-capitalize"
          v-for="category in categoryListWithURL"
          @click="$router.push(category.url)"
        >
          {{ category.name }}
        </div>
      </div>
    </template>
  </div>
</template>
<script>
export default {
  data() {
    return {
      categoryList: [],
      user: {},
      error: {
        code: 0,
        msg: ""
      }
    };
  },
  created() {
    this.$http
      .get(`http://localhost:3000/user/home`, {
        headers: {
          token: localStorage.token
        }
      })
      .then(res => {
        console.log(res.body);
        this.categoryList = res.body.categories;
        this.user = res.body.user;
      })
      .catch(error => {
        console.log(error.body);
        this.error = {
          code: 1,
          msg: error.body.error
        };
      });
  },
  computed: {
    categoryListWithURL: function() {
      return this.categoryList.map(category => {
        category.url = `/quiz/${category.category_id}`;
        return category;
      });
    }
  }
};
</script>
<style scoped></style>
