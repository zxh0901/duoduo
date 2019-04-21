<template>
  <div>
    <hea-der></hea-der>
    <div class="row bg-pd">
      <div class="col-2">
        <el-radio-group v-model="isCollapse" style="margin-bottom: 20px;">
          <el-radio-button :label="false">展开</el-radio-button>
          <el-radio-button :label="true">收起</el-radio-button>
        </el-radio-group>
        <el-menu
          :default-active="nowPath"
          class="el-menu-vertical-demo"
          active-text-color="#FFD84D"
          :collapse="isCollapse"
          :router="true"
        >
          <el-submenu index="1">
            <template slot="title">
              <i class="el-icon-location"></i>
              <span slot="title">用户资料</span>
            </template>
            <el-menu-item-group>
              <el-menu-item index="/usercenter/userbase">基本资料</el-menu-item>
              <el-menu-item @click="pwdShow">密码修改</el-menu-item>
            </el-menu-item-group>
          </el-submenu>
          <el-menu-item index="/usercenter/release">
            <i class="el-icon-document"></i>
            <span slot="title">发布闲置</span>
          </el-menu-item>
          <el-submenu index="3">
            <template slot="title">
              <i class="el-icon-menu"></i>
              <span slot="title">宝贝管理</span>
            </template>
            <el-menu-item-group>
              <el-menu-item index="/usercenter/goods_sx">上架/下架</el-menu-item>
              <el-menu-item index="/usercenter/goods_cs">正在出售</el-menu-item>
              <el-menu-item index="/usercenter/goods_mc">卖出历史</el-menu-item>
            </el-menu-item-group>
          </el-submenu>
          <el-submenu index="4">
            <template slot="title">
              <i class="el-icon-message"></i>
              <span slot="title">留言管理</span>
            </template>
            <el-menu-item-group>
              <el-menu-item index="/usercenter/my_message">我的留言</el-menu-item>
              <el-menu-item index="/usercenter/message_reply">我的消息</el-menu-item>
            </el-menu-item-group>
          </el-submenu>
        </el-menu>
      </div>
      <div class="col-10">
        <router-view></router-view>
      </div>
    </div>
    <div class="zl" v-if="pwd">
      <div class="zl-main">
        <div class="row">
          <h2 class="col-12">密码修改</h2>
          <div class="form-group col-12">
            <label>原密码：</label>
            <input
              type="password"
              class="form-control"
              v-model="oldPwd"
              @blur="verPwd"
              maxlength="16"
            >
          </div>
          <div class="form-group col-12">
            <label>新密码：</label>
            <input
              type="password"
              class="form-control"
              v-model="newPwd"
              @blur="verNewPwd"
              maxlength="16"
              :disabled="disabled2"
            >
          </div>
          <div class="form-group col-12">
            <label>确认密码：</label>
            <input
              type="password"
              class="form-control"
              v-model="newPwd2"
              @blur="verNewPwd2"
              maxlength="16"
              :disabled="disabled2"
            >
          </div>
          <div class="col-12">
            <div style="width:35%;float:right;">
              <button class="btn btn-success" :disabled="disabled" @click="setPwd">确定</button>
              <button class="btn btn-dark" @click="pwdShow">取消</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <foo-ter style="margin-top:30px;"></foo-ter>
    <footer-bottom></footer-bottom>
  </div>
</template>

<script>
import md5 from "js-md5";
import HeaDer from "../public/HeaDer";
import FooTer from "../public/FooTer";
import FooterBottom from "../public/FooterBottom";
export default {
  data() {
    return {
      isCollapse: false,
      nowPath: "",
      pwd: false,
      oldPwd: "",
      newPwd: "",
      newPwd2: "",
      disabled: true,
      disabled2: true
    };
  },
  mounted() {
    if (this.$cookies.get("username") == null) {
      this.$message("请先登录！");
      setTimeout(() => {
        window.location.pathname = "/";
      }, 3000);
    } else {
      this.nowPath = this.$route.fullPath;
    }
  },
  methods: {
    pwdShow() {
      this.pwd = !this.pwd;
    },
    verPwd() {
      if (this.oldPwd == "") {
        this.$message("原密码不能为空！");
      } else {
        this.axios({
          method: "post",
          url: "/login",
          data: this.qs.stringify({
            user: this.$cookies.get("username"),
            password: this.CalcuMD5(this.oldPwd)
          })
        })
          .then(res => {
            if (res.data.length != 1) {
              this.$message.error("原密码有误！");
              this.disabled2 = true;
            } else {
              this.disabled2 = false;
            }
          })
          .catch(err => {
            console.log(err);
          });
      }
    },
    verNewPwd() {
      let parents = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
      if (!parents.test(this.newPwd)) {
        this.$message("密码应由6~16位的数字和字母组成！");
      }
    },
    verNewPwd2() {
      if (this.newPwd != this.newPwd2) {
        this.$message("两次输入的密码不一致！");
      }
    },
    setPwd() {
      this.axios({
        method: "post",
        url: "/login/updatepwd",
        data: this.qs.stringify({
          name: this.$cookies.get("username"),
          newpwd: this.CalcuMD5(this.newPwd)
        })
      })
        .then(res => {
          if (res.data == "success") {
            this.$message.success("密码修改成功,请重新登录！");
            setTimeout(() => {
              this.$cookies.remove("username");
              this.$router.push("/");
            }, 3000);
          } else {
            this.$message.error("密码修改失败！");
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
  components: {
    HeaDer,
    FooTer,
    FooterBottom
  },
  watch: {
    newPwd2(n, o) {
      if (n != this.newPwd || n == "") {
        this.disabled = true;
      } else {
        this.disabled = false;
      }
    }
  }
};
</script>

<style>
.el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 200px;
  min-height: 400px;
}
label.is-active span {
  background: #ffd84d !important;
  border-color: #ffd84d !important;
  box-shadow: -1px 0 0 0 #ffd84d !important;
}
.bg-pd {
  background: #ffffff;
  padding: 20px 0;
  min-width: 1030px;
}
.zl {
  display: block;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.4);
}
.zl-main {
  display: flex;
  flex-direction: column;
  position: relative;
  background-color: #fefefe;
  margin: 10% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 540px;
  height: 400px;
  animation: topDown 0.4s;
  border-radius: 10px;
  overflow: auto;
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
</style>