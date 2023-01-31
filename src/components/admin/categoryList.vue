<template>
  <div class="container mt-3">
    <div class="alert alert-danger text-center" v-if="error.code == 1">
      <p>{{ error.msg }}</p>
    </div>
    <div v-else>
      <div class="alert alert-danger text-center" v-if="error.code > 1">
        <p>{{ error.msg }}</p>
      </div>
      <!-- add new category -->
      <form class="form w-25" @submit.prevent="addCategory">
        <legend>Add New Category</legend>
        <div>
          <label class="mb-1">Name</label>
          <input
            type="text"
            class="form-control mb-2"
            placeholder="Enter category name"
            v-model="newCategoryName"
            required
          />
        </div>
        <div>
          <button class="btn btn-primary mt-2">
            Add
          </button>
        </div>
      </form>

      <!-- list of categories -->
      <table class="table table-bordered">
        <caption style="caption-side: top;text-align: center;" class="h3">
          List of categories
        </caption>
        <tbody>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Category</th>
            <th scope="col">#'s of questions</th>
            <th></th>
            <th></th>
          </tr>
          <tr v-for="(category, index) in categoryListWithURL">
            <td scope="col">{{ index + 1 }}</td>
            <td>
              <router-link :to="category.url">{{ category.name }}</router-link>
            </td>
            <td>
              {{ category.count }}
            </td>
            <td
              class="text-left"
              v-if="updateRequestId == category.category_id"
            >
              <form @submit.prevent="handleUpdate">
                <div>
                  <label class="mb-1 text-left">new name</label>
                  <input
                    type="text"
                    class="form-control mb-2"
                    v-model="updatedCategoryName"
                  />
                  <button class="btn btn-primary">update</button>
                </div>
              </form>
            </td>
            <td class="text-center" v-else>
              <button
                class="btn btn-primary"
                @click="updateRequestId = category.category_id"
              >
                Update
              </button>
            </td>
            <td class="text-center">
              <button
                class="btn btn-danger"
                :id="category.category_id"
                @click="deleteCategory"
              >
                Delete
              </button>
            </td>
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
      error: {
        code: 0,
        msg: ""
      },
      categoryList: [],
      newCategoryName: "",
      updateRequestId: -1,
      updatedCategoryName: ""
    };
  },
  created() {
    this.$http
      .get("http://localhost:3000/category", {
        headers: {
          token: localStorage.getItem("token")
        }
      })
      .then(res => {
        console.log(res.body);
        this.categoryList = res.body.categories;
      })
      .catch(error => {
        this.error = {
          code: 1,
          msg: "admin rights required"
        };
        console.log(error.body);
      });
  },
  computed: {
    categoryListWithURL: function() {
      return this.categoryList.map(category => {
        category.url = `/category/${category.category_id}/questions`;
        return category;
      });
    }
  },
  methods: {
    addCategory: function() {
      this.$http
        .post(
          `http://localhost:3000/category/add`,
          {
            name: this.newCategoryName
          },
          {
            headers: {
              token: localStorage.token
            }
          }
        )
        .then(res => {
          let newCategory = res.body[0];
          newCategory.count = 0;
          this.categoryList.push(newCategory);
          console.log(res.body);
        })
        .catch(error => {
          console.log(error.body);
          this.error = {
            code: 2,
            msg: error.body.error
          };
        });
    },
    deleteCategory: function(event) {
      const id = event.target.id;
      const confiremed = window.confirm("Do you really want to delete it?");
      if (confiremed) {
        this.$http
          .delete(`http://localhost:3000/category/${id}`, {
            headers: {
              token: localStorage.token
            }
          })
          .then(res => {
            this.categoryList = this.categoryList.filter(category => {
              return category.category_id != id;
            });
          })
          .catch(error => {
            console.log(error.body);
            this.error = {
              code: 2,
              msg: error.body.error
            };
          });
      }
    },
    handleUpdate: function() {
      const id = this.updateRequestId;
      const name = this.updatedCategoryName;

      this.$http
        .put(
          `http://localhost:3000/category/${id}`,
          {
            name: name
          },
          {
            headers: {
              token: localStorage.token
            }
          }
        )
        .then(res => {
          console.log(res.body);
          this.categoryList = this.categoryList.map(category => {
            if (category.category_id == id) {
              category.name = name;
            }
            return category;
          });
        })
        .catch(error => {
          console.log(error.body);
          this.error = {
            code: 2,
            msg: error.body.error
          };
        });

      this.updatedCategoryName = "";
      this.updateRequestId = -1;
    }
  }
};
</script>
<style scoped></style>
