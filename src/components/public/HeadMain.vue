<template>
  <div class="container-fluid">
    <div class="container pos">
      <img src="/static/images/logo.png" alt width="8%" height="8%">
      <div class="ind">
        <strong>我的闲置</strong>
      </div>
      <strong class="txt">首页</strong>
      <div class="search">
        <input type="text" v-model="search" placeholder="search">
        <router-link :to="'/sname?name='+search">
          <img src="/static/images/search.png">
        </router-link>
      </div>
    </div>
    <div class="container">
      <img src="/static/images/banner.jpg" alt="加载失败" width="100%" height="100%">
    </div>
    <div class="user">
      <div class="user-head">
        <div class="user-img">
          <img :src="'/static/images/users/'+userImg" height="100%" width="100%">
        </div>
        <transition name="fade">
          <strong v-if="showName">
            <a href="javascript:void(0)" @click="loginShow">登录</a>
            <router-link to="/regpage">注册</router-link>
          </strong>
        </transition>
        <transition name="fade">
          <strong v-if="showName2">
            <router-link to="/usercenter/userbase">{{this.$cookies.get("username")}}</router-link>
            <a href="javascript:void(0)" @click="removeUser">注销</a>
          </strong>
        </transition>
        <span>{{userLabel}}</span>
      </div>
      <div class="user-footer">
        <div @click="goCs">
          <img src="/static/images/1.png" alt>
          <p>出售中</p>
          <strong>{{cs}}</strong>
        </div>
        <div @click="goMc">
          <img src="/static/images/2.png" alt>
          <p>卖出</p>
          <strong>{{mc}}</strong>
        </div>
        <div @click="goLy">
          <img src="/static/images/3.png" alt>
          <p>留言</p>
          <strong>{{ly}}</strong>
        </div>
        <div @click="goXx">
          <img src="/static/images/4.png" alt>
          <p>消息</p>
          <strong>{{xx}}</strong>
        </div>
      </div>
    </div>
    <login-mode @showLogin="showLogin" :show="show" @loginShow="loginShow"></login-mode>
  </div>
</template>

<script>
import LoginMode from "./LoginMode";
import bus from "@/assets/js/eventBus.js";
export default {
  name: "HeadMain",
  data() {
    return {
      search: "",
      show: false,
      showName: true,
      showName2: false,
      userImg: "user.png",
      userLabel: "虽然没挣到钱，但开心就好!",
      cs: 0,
      mc: 0,
      ly: 0,
      xx: 0
    };
  },
  mounted() {
    if (this.$cookies.get("username") != null) {
      this.showName2 = true;
      this.showName = false;
      this.getUser();
      this.getCs();
      this.getMc();
    } else {
      this.showName = true;
      this.showName2 = false;
    }
  },
  methods: {
    loginShow() {
      this.show = !this.show;
    },
    removeUser() {
      this.$cookies.remove("username");
      bus.$emit("updateCookie", 0);
      this.showName = true;
      this.showName2 = false;
      this.userImg = "user.png";
      this.cs = 0;
      this.mc = 0;
      this.ly = 0;
      this.xx = 0;
    },
    showLogin() {
      this.showName2 = true;
      this.showName = false;
      this.show = false;
      this.getUser();
    },
    getUser() {
      this.name = this.$cookies.get("username");
      this.axios({
        method: "post",
        url: "/login/getuser",
        data: this.qs.stringify({
          name: this.name
        })
      })
        .then(res => {
          if (res.data[0].img != null) {
            this.userImg = res.data[0].img;
          }
          this.userLabel = res.data[0].label;
          this.getCs();
          this.getMc();
          this.getLy();
          this.getXx();
        })
        .catch(err => {
          console.log(err);
        });
    },
    getCs() {
      this.axios({
        method: "get",
        url: "/goods/status/total",
        params: {
          name: this.$cookies.get("username"),
          gstatus: "已上架"
        }
      })
        .then(res => {
          this.cs = res.data[0].sum;
        })
        .catch(err => {
          console.log(err);
        });
    },
    getMc() {
      this.axios({
        method: "get",
        url: "/goods/status/total",
        params: {
          name: this.$cookies.get("username"),
          gstatus: "已下架"
        }
      })
        .then(res => {
          this.mc = res.data[0].sum;
        })
        .catch(err => {
          console.log(err);
        });
    },
    getLy() {
      this.axios({
        method: "get",
        url: "/goods/usermessage",
        params: {
          user: this.$cookies.get("username")
        }
      })
        .then(res => {
          this.ly = res.data.length;
        })
        .catch(err => {
          console.log(err);
        });
    },
    getXx() {
      this.axios({
        method: "get",
        url: "/goods/usermessage2",
        params: {
          user2: this.$cookies.get("username")
        }
      })
        .then(res => {
          this.xx = res.data.length;
        })
        .catch(err => {
          console.log(err);
        });
    },
    goLy() {
      if (this.$cookies.get("username") != null) {
        this.$router.push("/usercenter/my_message");
      }
    },
    goXx() {
      if (this.$cookies.get("username") != null) {
        this.$router.push("/usercenter/message_reply");
      }
    },
    goCs() {
      if (this.$cookies.get("username") != null) {
        this.$router.push("/usercenter/goods_cs");
      }
    },
    goMc() {
      if (this.$cookies.get("username") != null) {
        this.$router.push("/usercenter/goods_mc");
      }
    }
  },
  components: {
    LoginMode
  }
};
</script>

<style scoped>
.container-fluid {
  margin-bottom: 40px;
  background-color: #ffd84d;
  position: relative;
  margin-top: -20px;
  font-family: "微软雅黑";
}
.search {
  float: right;
  margin-top: 1%;
  margin-right: 5%;
  width: 20%;
}
.search input {
  width: 80%;
  border-radius: 4px;
  outline: none;
  padding-left: 5px;
  font-size: 14px;
  background: #ffffff;
  border: none;
}
.search img {
  width: 12%;
  margin-left: 4%;
}
.user-footer {
  height: 40%;
  width: 80%;
  margin: 0 auto;
}
.user-footer div {
  float: left;
  width: 25%;
  font-size: 14px;
  text-align: center;
  cursor: pointer;
}
.user-footer div img {
  width: 40%;
}
.user-footer p {
  margin-bottom: 0 !important;
}
.user {
  width: 27%;
  height: 62%;
  position: absolute;
  background: #ffffff;
  bottom: -1%;
  right: 10%;
  border-radius: 4px;
}
.user strong {
  font-size: 18px;
  margin-left: 5%;
}
.user span {
  font-size: 13px;
  margin-left: 5%;
  display: inline-block;
}
.user-head {
  width: 80%;
  height: 25%;
  margin: 10% auto;
}
.user-img {
  width: 20%;
  height: 100%;
  float: left;
}
.user-img img {
  border-radius: 50%;
}
.pos {
  position: absolute;
  left: 10%;
  top: 8%;
}
.ind {
  float: right;
  margin-right: 10%;
  margin-top: 1%;
  font-size: 14px;
  cursor: pointer;
  position: relative;
}
.ind:hover .han {
  display: block;
}
a {
  color: black;
  text-decoration: none;
}
.txt {
  float: right;
  font-size: 14px;
  margin-right: 5%;
  margin-top: 1%;
  cursor: pointer;
}
.txt::after {
  content: "";
  border-bottom: 2px solid black;
  display: block;
}
</style>
