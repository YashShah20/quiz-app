<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <!-- <span class="navbar-brand">Quiz App</span> -->
    <router-link class="navbar-brand" to="/about">Quiz App</router-link>
    <button
      class="navbar-toggler"
      type="button"
      data-toggle="collapse"
      data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <router-link class="nav-link" to="/home">Home</router-link>
        </li>
        <!-- <li class="nav-item">
          <router-link class="nav-link" to="/category">Category</router-link>
        </li> -->
        <!-- <li class="float-end ">
          <router-link class="nav-link" to="/quiz">Quiz</router-link>
        </li> -->
        <li class="nav-item">
          <router-link class="nav-link" to="/profile">Profile</router-link>
        </li>
      </ul>
      <div class="d-flex w-100 justify-content-end">
        <div class="btn btn-primary mx-3" @click="signin" v-if="!isSiggnedIn">
          Signin
        </div>
        <div class="btn btn-primary mx-3" @click="signout" v-else>
          Signout
        </div>
      </div>
    </div>

    <!-- <button class="btn" @click="isSiggnedIn=!isSiggnedIn">click me</button> -->
  </nav>
</template>
<script>
export default {
  props: ["isSiggnedIn"],
  methods: {
    signin: function() {
      this.$router.push({ name: "signin" });
    },
    signout: function() {
      localStorage.signnedIn = false;
      localStorage.removeItem("token");
      this.$emit("signout");
      this.$router.push({ name: "signin" });
    }
  }
};
</script>
<style scoped>
.router-link-exact-active {
  background-color: white;
  color: black;
  font-weight: bolder;
  border-radius: 10px;
}
.navbar-brand {
  background-color: transparent;
  color: white;
  font-weight: normal;
  margin-left: 10px;
  border-radius: 10px;
}
</style>
