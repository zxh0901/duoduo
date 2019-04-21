<template>
  <div>
    <div class="form-group row fbly">
      <div class="col-12">
        <textarea class="form-control" rows="2" v-model="message"></textarea>
        <button class="btn btn-success btn-sm fbly_btn" @click="addMessage">发表留言</button>
      </div>
    </div>
    <div class="row">
      <div class="col-12" v-for="item of messages" :key="item.id">
        <div class="message_p">
          <div class="message_img">
            <img :src="'/static/images/users/'+item.userimg" width="100%">
            <p style="float:left;margin-left:5px;margin-top:-50px;width:300px;">{{item.user}}</p>
          </div>
          <p>{{item.message}}</p>
          <p style="text-align:right;">{{item.mdate}}</p>
          <p v-if="item.mshow">卖家回复：{{item.mreply}}</p>
        </div>
      </div>
      <div class="col-12 text-center" v-if="show">
        <img src="/static/images/nothing.png">
        <p style="color:#9c9c9c;">还没有留言，快去抢沙发吧！</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      messages: [],
      mdate: "",
      message: "",
      show: false,
      list: [],
      list2: []
    };
  },
  props: {
    id: {
      default: 1
    },
    user: {
      default: []
    }
  },
  mounted() {
    this.getMessage();
  },
  methods: {
    addMessage() {
      if (this.$cookies.get("username") == null) {
        this.$message("请先登录再留言！");
        return;
      } else if (this.message == "") {
        this.$message("留言不能为空！");
        return;
      }
      let data = new Date();
      this.mdate =
        data.getFullYear() + "-" + (data.getMonth() + 1) + "-" + data.getDate();
      this.axios({
        method: "get",
        url: "/goods/addmessage",
        params: {
          user: this.$cookies.get("username"),
          userimg: this.$cookies.get("userimg"),
          message: this.message,
          gid: this.$route.query.id,
          mdate: this.mdate,
          user2: this.list.user,
          userimg2: this.list2.img
        }
      })
        .then(res => {
          if (res.data == "success") {
            this.$message.success("留言发表成功！");
            this.getMessage();
            this.message = "";
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    getMessage() {
      this.axios({
        method: "get",
        url: "/goods/message",
        params: {
          gid: this.$route.query.id
        }
      })
        .then(res => {
          this.messages = res.data;
          if (this.messages.length == 0) {
            this.show = true;
          } else {
            this.show = false;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    getUser() {
      this.axios({
        method: "post",
        url: "/login/getuser",
        data: this.qs.stringify({
          name: this.list.user
        })
      })
        .then(res => {
          this.list2 = res.data[0];
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  watch: {
    id(n, o) {
      this.getMessage();
    },
    user(n, o) {
      this.list = n;
      this.getUser();
    }
  }
};
</script>

<style scoped>
.fbly {
  border-bottom: 1px dashed #c0c0c0;
  padding: 20px;
}
.fbly_btn {
  float: right;
  margin-top: 10px;
}
.message_p {
  border-bottom: 1px dashed #c0c0c0;
  padding: 20px;
}
.message_p p {
  margin-bottom: 0;
  padding-top: 20px;
  padding-left: 40px;
}
.message_img {
  width: 40px;
  height: 40px;
}
.message_img img {
  border-radius: 50%;
  padding-left: -20px;
}
</style>