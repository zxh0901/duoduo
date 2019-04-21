<template>
  <div>
    <div class="row reply-title">
      <el-breadcrumb separator-class="el-icon-arrow-right" class="release">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>个人中心</el-breadcrumb-item>
        <el-breadcrumb-item>留言管理</el-breadcrumb-item>
        <el-breadcrumb-item>我的消息</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="row reply-main">
      <div class="col-12 reply-text" v-for="item of message" :key="item.id">
        <div class="reply-img">
          <img :src="'/static/images/users/'+item.userimg">
        </div>
        <p>
          <strong>{{item.user}}</strong> 给您留言了
        </p>
        <p class="reply-p">{{item.message}}</p>
        <p class="reply-p" style="text-align:right;">{{item.mdate}}</p>
        <p v-if="item.mshow">我的回复：{{item.mreply}}</p>
        <button class="btn btn-success btn-sm btn-style" @click="mShow(item.id)">回复</button>
      </div>
      <div class="col-12 not-img" v-if="show">
        <img src="/static/images/nothing.png">
        <p>这里是空的哦！</p>
      </div>
    </div>
    <el-dialog title="留言回复" :visible.sync="deleteShow">
      <el-form>
        <label>回复内容：</label>
        <textarea class="form-control" rows="2" v-model="mreply"></textarea>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <button class="btn-success btn" @click="updateMessage">确 定</button>
        <button class="btn btn-dark" @click="deleteShow = false">取 消</button>
      </div>
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
      mreply: "",
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
        url: "/goods/usermessage2",
        params: {
          user2: this.$cookies.get("username")
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
    updateMessage() {
      if (this.mreply == "") {
        this.$message("回复内容不能为空！");
        return;
      }
      this.axios({
        method: "get",
        url: "/goods/replymessage",
        params: {
          id: this.id,
          mreply: this.mreply
        }
      })
        .then(res => {
          if (res.data == "success") {
            this.$message.success("留言已回复！");
            this.getMessage();
            this.deleteShow = false;
            this.mreply = "";
          } else {
            this.$message.error("留言回复失败！");
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    mShow(v) {
      this.deleteShow = true;
      this.id = v;
    }
  }
};
</script>

<style scoped>
.reply-title,
.reply-main {
  width: 80%;
  margin: 0px auto 30px auto;
}
.reply-text {
  border-bottom: 1px solid #c0c0c0;
  padding: 10px;
}
.btn-style {
  float: right;
  margin-top: -10%;
}
.reply-p {
  width: 80%;
}
.reply-img {
  width: 50px;
  height: 50px;
  float: left;
  margin-right: 15px;
  margin-top: 10px;
}
.reply-img img {
  width: 100%;
  border-radius: 50%;
}
.not-img {
  padding-top: 80px;
  text-align: center;
  color: #9c9c9c;
}
</style>