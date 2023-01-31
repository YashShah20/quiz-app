<template>
  <div class="container mt-5">
    <h2 class="text-center">Sign In</h2>
    <div v-if="error.code > 0" class="alert alert-danger my-3 text-center">
      {{ error.msg }}
    </div>
    <form class="d-flex flex-column" v-on:submit.prevent="handleSubmit">
      <div class="my-2">
        <label class="mb-1 text-capitalize">username</label>
        <input required type="text" class="form-control" v-model="user.name" />
      </div>
      <div class="my-2">
        <label class="mb-1 text-capitalize">password</label>
        <input
          required
          type="password"
          class="form-control"
          v-model="user.password"
        />
      </div>
      <div class="my-2 text-center">
        <button class="btn btn-primary">Signin</button>
      </div>
    </form>
    <div class="text-center mt-2">
      Not have an account?
      <router-link to="/signup">signup here</router-link>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      user: {
        name: "yash",
        password: "abc"
      },
      error: {
        code: 0,
        msg: ""
      }
    };
  },
  methods: {
    handleSubmit: function(event) {
      this.$http
        .post("http://localhost:3000/auth/signin", this.user)
        .then(res => {
          localStorage.setItem("token", res.body.token);
          localStorage.setItem("user", res.body.user);
          localStorage.setItem("signnedIn", true);

          this.$emit("signin");
          this.$router.push({ name: "home" });
        })
        .catch(error => {
          this.error = {
            code: 1,
            msg: error.body.error
          };
        });
    }
  }
};
</script>

<style></style>
