<template>
  <div class="container mt-5">
    <h2 class="text-center">Sign Up</h2>
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
      <div class="my-2">
        <label class="mb-1 text-capitalize">Confirm password</label>
        <input
          required
          type="password"
          class="form-control"
          v-model="user.cpassword"
        />
      </div>
      <div class="my-2 text-center">
        <button class="btn btn-primary">Signup</button>
      </div>
    </form>
    <div class="text-center mt-2">
      Already have an account?
      <router-link to="/">signin here</router-link>
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
      user: {
        name: "yash",
        role: 2,
        password: "abc",
        cpassword: "abc"
      }
    };
  },
  methods: {
    handleSubmit: function() {
      if (this.validate()) {
        console.log(this.user);
        this.$http
          .post(`http://localhost:3000/auth/signup`, this.user)
          .then(res => {
            console.log(res.body);
            this.$router.push({ name: "signin" });
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
    validate: function() {
      if (this.user.cpassword === this.user.password) {
        return true;
      } else {
        this.error = {
          code: 1,
          msg: "password and confirm password must match"
        };
        return false;
      }
    }
  }
};
</script>
<style scoped></style>
