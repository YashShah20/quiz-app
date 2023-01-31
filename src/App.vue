<template>
  <div id="app">
    <app-navbar :isSiggnedIn="isSiggnedIn" @signout="isSiggnedIn=false" class="p-2"></app-navbar>
    <router-view @signin="isSiggnedIn=true"></router-view>
  </div>
</template>

<script>
import navbar from "./components/navbar.vue";

export default {
  name: "app",
  components: {
    "app-navbar": navbar
  },
  created() {
    this.isSiggnedIn = localStorage.signnedIn === "true";
  },
  data() {
    return {
      isSiggnedIn: false
    };
  }
};
</script>

<style>
@import "~bootstrap/dist/css/bootstrap.css";
</style>
