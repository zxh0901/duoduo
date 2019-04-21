<template>
  <div class="modal" v-show="show">
    <div class="modal-content">
      <div class="modal-header">
        <h2>用户登录</h2>
        <span class="close" @click="loginShow">&times;</span>
      </div>
      <div class="modal-body">
        <form>
          <div class="row">
            <label for="user" class="col-4">用户名</label>
            <input
              type="text"
              id="user"
              placeholder="用户名长度3~10位"
              name="user"
              v-model="user"
              class="col-6 form-control"
              @blur="yhm"
            >
          </div>
          <br>
          <div class="row">
            <label for="password" class="col-4">密码</label>
            <input
              :disabled="disabled"
              type="password"
              id="password"
              placeholder="密码长度6~16位"
              name="password"
              v-model="password"
              class="col-6 form-control"
              @blur="mm"
            >
          </div>
          <br>
          <br>
          <input
            :disabled="disabled2"
            type="button"
            value="登  录"
            class="btn btn-warning col-2"
            @click="login"
          >
          <span style="margin-left:20%;"></span>
          <input type="button" value="重  置" class="btn btn-dark col-2" @click="clr">
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import md5 from "js-md5";
import bus from "@/assets/js/eventBus.js";
export default {
  data() {
    return {
      user: "",
      password: "",
      disabled: true,
      disabled2: true
    };
  },
  props: {
    show: {
      type: Boolean,
      default: false
    }
  },
  methods: {
    loginShow() {
      this.$emit("loginShow", false);
    },
    clr() {
      this.user = "";
      this.password = "";
    },
    yhm() {
      if (this.user == "") {
        this.$message({
          type: "warning",
          showClose: true,
          message: "用户名不能为空！"
        });
      } else if (
        this.user.split("").length < 3 ||
        this.user.split("").length > 10
      ) {
        this.$message({
          type: "warning",
          showClose: true,
          message: "用户名长度应在3~10位之间"
        });
      }
    },
    mm() {
      if (this.password == "") {
        this.$message({
          type: "warning",
          showClose: true,
          message: "密码不能为空！"
        });
      } else if (
        this.password.split("").length < 6 ||
        this.password.split("").length > 16
      ) {
        this.$message({
          type: "warning",
          showClose: true,
          message: "密码长度应在6~16位之间"
        });
      }
    },
    login() {
      this.axios({
        method: "post",
        url: "/login",
        data: this.qs.stringify({
          user: this.user,
          password: this.CalcuMD5(this.password)
        })
      })
        .then(res => {
          if (res.data.length == 1) {
            this.$cookies.set("username", res.data[0].name, 60 * 60 * 24);
            this.$cookies.set("userimg", res.data[0].img, 60 * 60 * 24);
            this.$message({
              message: "欢迎您：" + res.data[0].name + "！",
              type: "success"
            });
            bus.$emit("updateCookie", 1);
            this.user = "";
            this.password = "";
            this.$emit("showLogin");
          } else {
            this.$message({
              message: "用户名或密码有误，请重新输入！",
              type: "error",
              showClose: true
            });
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    CalcuMD5(pwd) {
      pwd = pwd.toUpperCase();
      pwd = md5(pwd);
      return pwd;
    }
  },
  watch: {
    user(n, o) {
      if (n != "" && n.split("").length > 2 && n.split("").length < 11) {
        this.disabled = false;
      } else {
        this.disabled = true;
      }
    },
    password(n, o) {
      if (n != "" && n.split("").length > 5 && n.split("").length < 17) {
        this.disabled2 = false;
      } else {
        this.disabled2 = true;
      }
    }
  }
};
</script>

<style scoped>
.modal {
  display: block;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  text-align: center;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
  display: flex; /*采用flexbox布局*/
  flex-direction: column; /*垂直排列*/
  position: relative;
  background-color: #fefefe;
  margin: 10% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 540px;
  height: 340px;
  animation: topDown 0.4s;
}

@keyframes topDown {
  from {
    top: -300px;
    opacity: 0;
  }
  to {
    top: 0;
    opacity: 1;
  }
}

.modal-header {
  display: flex; /*采用flexbox布局*/
  flex-direction: row; /*水平布局*/
  align-items: center; /*内容垂直居中*/
  justify-content: space-between;
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
</style>