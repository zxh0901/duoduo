<template>
  <div>
    <hea-der></hea-der>
    <div class="container reg-main">
      <el-steps :active="active" finish-status="success">
        <el-step title="用户名"></el-step>
        <el-step title="手机号码"></el-step>
        <el-step title="密码"></el-step>
      </el-steps>
      <form>
        <h3>欢迎注册多多帐号</h3>
        <img src="/static/images/account.svg">
        <div class="form-group" v-show="yhm">
          <label for="name">用户名:</label>
          <input
            type="text"
            v-model="name"
            class="form-control"
            id="email"
            placeholder="请输入3~10位用户名"
            maxlength="10"
            v-debounce="verName"
          >
        </div>
        <div class="form-group" v-show="sjhm">
          <label for="phone">手机号码:</label>
          <input
            type="text"
            v-model="phone"
            class="form-control"
            id="phone"
            placeholder="请输入11位手机号码"
            maxlength="11"
            v-debounce="verPhone"
          >
        </div>
        <div class="form-group" v-show="mm">
          <label for="password">密码:</label>
          <input
            type="password"
            v-model="password"
            class="form-control"
            id="password"
            placeholder="请输入6~16位密码"
            maxlength="16"
            v-debounce="verPassword"
          >
        </div>
        <div class="form-group" v-show="mm">
          <label for="password2">确认密码:</label>
          <input
            type="password"
            v-model="password2"
            class="form-control"
            id="password2"
            placeholder="请输入确认密码"
            maxlength="16"
            debounce="500"
            v-debounce="verPassword2"
          >
        </div>
      </form>
      <div class="btn-bottom">
        <button class="btn" v-show="show" @click="pre">上一步</button>
        <span style="margin-left:5%"></span>
        <button class="btn btn-success" v-show="ne" @click="next" :disabled="disabled">下一步</button>
        <button class="btn btn-success" v-show="cl" @click="setNew" :disabled="disabled">注册</button>
      </div>
    </div>
    <foo-ter></foo-ter>
    <footer-bottom></footer-bottom>
  </div>
</template>

<script>
import md5 from "js-md5";
import HeaDer from "../public/HeaDer";
import FooTer from "../public/FooTer";
import FooterBottom from "../public/FooterBottom";
export default {
  name: "GoodsList",
  data() {
    return {
      active: 0,
      name: "",
      password: "",
      password2: "",
      phone: "",
      show: false,
      message: "下一步",
      disabled: true,
      yhm: true,
      sjhm: false,
      mm: false,
      ne: true,
      cl: false
    };
  },
  mounted() {},
  methods: {
    next() {
      if (this.active++ > 2) {
        this.active = 0;
      } else if (this.active == 2) {
        this.cl = true;
        this.ne = false;
      }
    },
    pre() {
      if (this.active-- < 0) {
        this.active = 0;
      } else if (this.active == 0 || this.active == 1) {
        this.ne = true;
        this.cl = false;
      }
    },
    ver() {
      this.axios({
        method: "post",
        url: "/register/ver",
        data: this.qs.stringify({
          name: this.name
        })
      })
        .then(res => {
          if (res.data.length != 1) {
            this.$message.success("请点击下一步！");
            this.disabled = false;
          } else {
            this.$message.warning("该用户名已被注册，请重新输入用户名！");
            this.disabled = true;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    setNew() {
      this.active = 0;
      this.axios({
        method: "post",
        url: "/register",
        data: this.qs.stringify({
          name: this.name,
          password: this.CalcuMD5(this.password),
          phone: this.phone
        })
      })
        .then(res => {
          if (res.data == "success") {
            this.$message.success("注册成功！即将前往首页登录...");
            this.yhm = true;
            this.ne = true;
            this.cl = false;
            this.disabled = true;
            setTimeout(function() {
              window.location.replace("/");
            }, 3000);
          } else {
            this.$message.error("注册失败！");
            this.yhm = true;
            this.ne = true;
            this.cl = false;
            this.disabled = true;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    verName() {
      if (this.name.split("").length < 3 || this.name.split("").length > 10) {
        this.$message("用户名长度应在3~10位之间！");
        this.disabled = true;
      } else {
        this.ver();
      }
    },
    verPhone() {
      let parents = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
      if (!parents.test(this.phone)) {
        this.$message.error("号码格式不正确！");
        this.disabled = true;
      } else {
        this.$message.success("请点击下一步！");
        this.disabled = false;
      }
    },
    verPassword() {
      let parents = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
      if (this.password == "") {
        this.$message("密码不能为空！");
        this.disabled = true;
      } else if (
        this.password.split("").length < 6 ||
        this.password.split("").length > 16
      ) {
        this.$message("密码长度应在6~16位之间！");
        this.disabled = true;
      } else if (!parents.test(this.password)) {
        this.$message("密码应由数字和字母组成！");
      } else {
        this.$message.success("格式正确！");
      }
    },
    verPassword2() {
      if (this.password2 != this.password) {
        this.$message("两次输入的密码不一致！");
        this.disabled = true;
      } else if (this.password2 == "") {
        this.$message("确认密码不能为空！");
        this.disabled = true;
      } else {
        this.$message.success("请点击注册按钮进行注册！");
        this.disabled = false;
      }
    },
    CalcuMD5(pwd) {
      pwd = pwd.toUpperCase();
      pwd = md5(pwd);
      return pwd;
    }
  },
  components: {
    FooTer,
    FooterBottom,
    HeaDer
  },
  directives: {
    debounce: {
      inserted: function(el, binding) {
        let timer;
        el.addEventListener("input", () => {
          if (timer) {
            clearTimeout(timer);
          }
          timer = setTimeout(() => {
            binding.value();
          }, 1000);
        });
      }
    }
  },
  watch: {
    active(newActive, oldActive) {
      if (newActive == 0) {
        this.show = false;
        this.yhm = true;
        this.sjhm = false;
        this.mm = false;
      } else if (newActive == 1) {
        this.show = true;
        this.disabled = !this.disabled;
        this.yhm = false;
        this.sjhm = true;
        this.mm = false;
      } else if (newActive == 2) {
        this.message = "注册";
        this.disabled = !this.disabled;
        this.yhm = false;
        this.sjhm = false;
        this.mm = true;
      }
    }
  }
};
</script>

<style scoped>
.reg-main {
  min-height: 410px;
  position: relative;
}
.reg-main form {
  width: 60%;
  margin: 5% auto;
}
.reg-main form h3 {
  margin: 5% 0;
}
.reg-main form input {
  width: 50%;
}
.reg-main form img {
  width: 40%;
  float: right;
  margin-top: -15%;
}
.btn-bottom {
  position: absolute;
  width: 50%;
  bottom: 0;
  right: 10%;
  text-align: right;
}
.btn-success {
  color: #fff;
  background-color: #ffd84d;
  border-color: #ffd84d;
}
</style>