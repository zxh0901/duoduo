<template>
  <div class="container">
    <div class="two row" v-if="show1">
      <div class="two-1 col-5" @click="msg">
        <img src="/static/images/TB2.png" alt>
        <dl>
          <dt>一键转卖</dt>
          <dd>其他平台买过的宝贝能换钱，他们都在用多多</dd>
        </dl>
      </div>
      <div class="two-2 col-4" @click="msg">
        <img src="/static/images/TB1.png" alt>
        <dl>
          <dt>发布闲置</dt>
          <dd>闲置换钱，快速出手</dd>
        </dl>
      </div>
    </div>
    <div class="two row" v-if="show2">
      <div class="two-1 col-5">
        <router-link to="/usercenter/release">
          <img src="/static/images/TB2.png" alt>
          <dl>
            <dt>一键转卖</dt>
            <dd>其他平台买过的宝贝能换钱，他们都在用多多</dd>
          </dl>
        </router-link>
      </div>
      <div class="two-2 col-4">
        <router-link to="/usercenter/release">
          <img src="/static/images/TB1.png" alt>
          <dl>
            <dt>发布闲置</dt>
            <dd>闲置换钱，快速出手</dd>
          </dl>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
import bus from "@/assets/js/eventBus.js";
export default {
  data() {
    return {
      show1: true,
      show2: false
    };
  },
  created() {
    bus.$on("updateCookie", message => {
      if (message == 1) {
        this.show1 = false;
        this.show2 = true;
      } else {
        this.show1 = true;
        this.show2 = false;
      }
    });
  },
  mounted() {
    if (this.$cookies.get("username") != null) {
      this.show1 = false;
      this.show2 = true;
    } else {
      this.show1 = true;
      this.show2 = false;
    }
  },
  methods: {
    msg() {
      this.$message("请先登录再进行宝贝发布哦！");
    }
  }
};
</script>

<style scoped>
.container {
  margin-top: 20px;
}
.two {
  background: #ffffff;
  height: 110px;
  overflow: hidden;
  border-radius: 4px;
}
.two-1,
.two-2 {
  cursor: pointer;
  height: 56px;
  margin-top: 28px;
  margin-left: 10%;
}
.two-1 {
  border-right: 1px solid #ccc;
}
.two img {
  width: 56px;
  height: 56px;
  float: left;
}
.two dt {
  font-size: 20px;
}
.two dd {
  font-size: 12px;
}
.two-1 a:hover,
.two-2 a:hover {
  color: black;
  text-decoration: none;
}
</style>
