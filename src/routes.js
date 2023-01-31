import signin from "./components/signin.vue";
import signup from "./components/signup.vue";
import about from "./components/about.vue";

import home from "./components/user/home.vue";
import profile from "./components/user/profile.vue";

import questionList from "./components/admin/questionList.vue";
import categoryList from "./components/admin/categoryList.vue";
import addQuestion from "./components/admin/addQuestion.vue";

import quiz from "./components/quiz/quiz.vue";
import result from "./components/quiz/result.vue";

export default [
  {
    path: "/signup",
    component: signup,
    name: "signup"
  },
  {
    path: "/about",
    component: about,
    name: "about"
  },
  {
    path: "/home",
    component: home,
    name: "home"
  },
  {
    path: "/profile",
    component: profile,
    name: "profile"
  },
  {
    path: "/quiz/:cid",
    component: quiz,
    name: "quiz"
  },
  {
    path: "/result",
    component: result,
    name: "result"
  },
  {
    path: "/category",
    component: categoryList,
    name: "category"
  },
  {
    path: "/category/:cid/questions",
    component: questionList,
    name: "questions"
  },
  {
    path: "/category/:cid/questions/add",
    component: addQuestion,
    name: "addQuestion"
  },
  {
    path: "/",
    component: signin,
    name: "signin"
  }
];
