<template>
  <div>
    <div class="row message-title">
      <el-breadcrumb separator-class="el-icon-arrow-right" class="release">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>个人中心</el-breadcrumb-item>
        <el-breadcrumb-item>留言管理</el-breadcrumb-item>
        <el-breadcrumb-item>我的留言</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="row message-main">
      <div class="col-12 message-text" v-for="item of message" :key="item.id">
        <div class="message-img">
          <img :src="'/static/images/users/'+item.userimg2">
        </div>
        <p>
          您给
          <strong>{{item.user2}}</strong> 留言了
        </p>
        <p class="message-p">{{item.message}}</p>
        <p class="message-p" style="text-align:right;">{{item.mdate}}</p>
        <p v-if="item.mshow">他的回复：{{item.mreply}}</p>
        <button class="btn btn-success btn-sm btn-style" @click="mShow(item.id)">删除</button>
      </div>
      <div class="col-12 not-img" v-if="show">
        <img src="/static/images/nothing.png">
        <p>这里是空的哦！</p>
      </div>
    </div>
    <el-dialog title="提示" :visible.sync="deleteShow" width="30%">
      <span>确定要删除这条留言吗？</span>
      <span slot="footer" class="dialog-footer">
        <button class="btn-success btn" @click="deleteMessage">确 定</button>
        <button class="btn btn-dark" @click="deleteShow = false">取 消</button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      message: [],
      deleteShow: false,
      id: 0,
      show: false
    };
  },
  mounted() {
    this.getMessage();
  },
  methods: {
    getMessage() {
      this.axios({
        method: "get",
        url: "/goods/usermessage",
        params: {
          user: this.$cookies.get("username")
        }
      })
        .then(res => {
          this.message = res.data;
          if (this.message.length < 1) {
            this.show = true;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    mShow(v) {
      this.deleteShow = true;
      this.id = v;
    },
    deleteMessage() {
      this.axios({
        method: "get",
        url: "/goods/deletemessage",
        params: {
          id: this.id
        }
      }).then(res => {
        if (res.data == "success") {
          this.$message.success("留言已删除！");
          this.getMessage();
          this.deleteShow = false;
        } else {
          this.$message.error("留言删除失败！");
        }
      });
    }
  }
};
</script>

<style scoped>
.message-title,
.message-main {
  width: 80%;
  margin: 0px auto 30px auto;
}
.message-text {
  border-bottom: 1px solid #c0c0c0;
  padding: 10px;
}
.btn-style {
  float: right;
  margin-top: -10%;
}
.message-p {
  width: 80%;
}
.message-img {
  width: 50px;
  height: 50px;
  float: left;
  margin-right: 15px;
  margin-top: 10px;
}
.message-img img {
  width: 100%;
  border-radius: 50%;
}
.not-img {
  padding-top: 80px;
  text-align: center;
  color: #9c9c9c;
}
</style>