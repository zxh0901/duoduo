<template>
  <div class="container list_top">
    <div class="row zhuyao">
      <div class="user_img col-1">
        <img :src="'/static/images/users/'+user.img">
      </div>
      <div class="col-2 user_name">
        <img src="/static/images/mp.png">
        <img src="/static/images/hy.png">
        <strong>{{user.name}}</strong>
      </div>
      <div class="ciyao col">
        <p>{{user.sex}}</p>
        <p>联系方式：{{user.phone}}</p>
        <p>出生日期：{{user.birthday}}</p>
        <p>所在地：{{user.address}}</p>
      </div>
      <div class="col-1 text-center lz">
        <span>来自</span>
        <img src="/static/images/logo.png">
      </div>
      <div class="col-8 jb">
        <p>举报该宝贝</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      user: []
    };
  },
  props: {
    list: {
      default: []
    }
  },
  methods: {
    getUser() {
      this.axios({
        method: "post",
        url: "/login/getuser",
        data: this.qs.stringify({
          name: this.list.user
        })
      })
        .then(res => {
          this.user = res.data[0];
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  watch: {
    list(n, o) {
      if (n != []) {
        this.getUser();
      }
    }
  }
};
</script>

<style scoped>
.list_top {
  height: 60px;
  border: 1px #c0c0c0 solid;
  border-top: 2px #333333 solid;
  border-radius: 0 0 4px 4px;
  margin-top: -20px;
  vertical-align: middle;
  background: #ffffff;
}
.list_top .user_img {
  width: 60px;
  height: 60px;
  line-height: 50px;
  text-align: center;
}
.list_top .user_img img {
  width: 70%;
  border-radius: 50%;
}
.user_name {
  margin-left: -2.5%;
  border-right: 1px #c0c0c0 solid;
  margin-bottom: 3px;
}
.user_name img {
  width: 15%;
}
.user_name strong {
  float: left;
  margin-right: 77%;
  display: block;
  width: 100%;
  overflow: hidden;
}
.lz {
  color: #999999;
  border-right: 1px #c0c0c0 solid;
  margin-bottom: 3px;
  font-size: 13px;
  line-height: 23px;
}
.lz img {
  width: 60%;
}
.jb p {
  float: right;
  font-size: 13px;
  color: red;
  margin-top: 2%;
  cursor: pointer;
}
.zhuyao {
  position: relative;
}
.ciyao {
  position: absolute;
  z-index: 99;
  top: 57px;
  left: 0;
  border: 1px #c0c0c0 solid;
  height: 0;
  overflow: hidden;
  visibility: hidden;
  transition: all 0.5s;
  border-radius: 0 0 2px 2px;
  background: #ffffff;
}
.zhuyao:hover .ciyao {
  visibility: visible;
  height: 162px;
  box-shadow: 2px 2px 2px #ccc;
}
</style>