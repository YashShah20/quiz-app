import Vue from "vue";
import App from "./App.vue";
import VueRouter from "vue-router";
import VueResource from "vue-resource";
import routes from "./routes";

import "bootstrap/dist/css/bootstrap.min.css";
import 'jquery/src/jquery.js'

Vue.use(VueResource);
Vue.use(VueRouter);

const router = new VueRouter({
  routes: routes
});

new Vue({
  el: "#app",
  render: h => h(App),
  router: router
});
