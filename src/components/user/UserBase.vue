<template>
  <div>
    <div class="row user-title">
      <el-breadcrumb separator-class="el-icon-arrow-right" class="release">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>个人中心</el-breadcrumb-item>
        <el-breadcrumb-item>用户资料</el-breadcrumb-item>
        <el-breadcrumb-item>基本资料</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="row user-top">
      <div class="col-2 user-img text-center" style="min-width:142px;">
        <img :src="'/static/images/users/'+img">
        <button class="btn btn-success btn-sm" @click="txShow">更换头像</button>
      </div>
      <div class="col-8">
        <p>
          用户名： {{name}}
          <i class="el-icon-mobile-phone"></i>
        </p>
        <p>会员类型： 您还不是多多会员</p>
        <p>UID：12436388{{uId}}</p>
        <p>
          个性签名：{{label}}
          <i class="el-icon-edit"></i>
        </p>
      </div>
    </div>
    <div class="row user-main">
      <div class="col-12">
        <div class="row">
          <div class="col-2">性别：</div>
          <div class="col-6">{{sex}}</div>
        </div>
      </div>
      <div class="col-12">
        <div class="row">
          <div class="col-2">生日：</div>
          <div class="col-6">{{age}}</div>
        </div>
      </div>
      <div class="col-12">
        <div class="row">
          <div class="col-2">居住地：</div>
          <div class="col-6">{{address}}</div>
        </div>
      </div>
      <div class="col-12">
        <div class="row">
          <div class="col-2">联系电话：</div>
          <div class="col-6">{{phone}}</div>
        </div>
      </div>
      <div class="col-12">
        <button class="btn btn-success btn-sm" @click="zlShow">修改</button>
      </div>
    </div>
    <div class="zl" v-if="tx">
      <div class="zl-main">
        <div class="row">
          <div class="col-12">
            <h2>更换头像</h2>
          </div>
          <div class="col-12" style="margin-top:30px;">
            <p>请选择头像：</p>
            <div class="custom-file">
              <input
                type="file"
                accept="image/*"
                class="custom-file-input"
                id="customFile"
                @change="getFile"
              >
              <label class="custom-file-label" for="customFile">{{newImg.name}}</label>
            </div>
          </div>
          <div class="col-12">
            <div style="margin-top:150px;float:right;width:35%;">
              <button class="btn btn-success" @click="updateUserimg">上传</button>
              <button class="btn btn-dark" @click="txShow">取消</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="zl" v-if="zl">
      <div class="zl-main">
        <div class="row">
          <h2 class="col-12">资料修改</h2>
          <div class="form-group col-6">
            <label>性别：</label>
            <select class="form-control" v-model="sex">
              <option value="男">男</option>
              <option value="女">女</option>
            </select>
          </div>
          <div class="form-group col-6">
            <label>生日：</label>
            <el-date-picker style="width:100%;" v-model="birthday" type="date" placeholder="选择日期"></el-date-picker>
          </div>
          <div class="form-group col-6">
            <label>居住地：</label>
            <input type="text" class="form-control" v-model="address">
          </div>
          <div class="form-group col-6">
            <label>联系电话：</label>
            <input type="text" class="form-control" v-model="phone">
          </div>
          <div class="form-group col-12">
            <label>个性签名：</label>
            <textarea class="form-control" rows="2" v-model="label"></textarea>
          </div>
          <div class="col-12">
            <div style="width:35%;float:right;">
              <button class="btn btn-success" @click="setUser">确定</button>
              <button class="btn btn-dark" @click="zlShow">取消</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "UserBase",
  data() {
    return {
      uId: "",
      name: "",
      img: "",
      sex: "",
      phone: "",
      address: "",
      birthday: "",
      age: "",
      label: "",
      zl: false,
      tx: false,
      newImg: ""
    };
  },
  mounted() {
    this.getUser();
  },
  methods: {
    zlShow() {
      this.zl = !this.zl;
    },
    txShow() {
      this.tx = !this.tx;
      this.newImg = "";
    },
    getFile(e) {
      this.newImg = e.target.files[0];
    },
    updateUserimg() {
      let Form = new FormData();
      Form.append("img", this.newImg);
      Form.append("name", this.name);
      if (this.newImg == "") {
        this.$message("请先选择一张图片！");
      } else {
        this.axios({
          method: "post",
          url: "/login/updateuserimg",
          data: Form,
          headers: {
            "content-type": "multipart/form-data"
          }
        })
          .then(rel => {
            if (rel.data == "success") {
              this.$message.success("头像修改成功！");
              this.getUser();
              this.txShow();
            } else {
              this.$message.error("头像修改失败！");
            }
          })
          .catch(err => {
            console.log(err);
          });
      }
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
            this.img = res.data[0].img;
          } else {
            this.img = "user.png";
          }
          this.uId = res.data[0].id;
          this.sex = res.data[0].sex;
          this.phone = res.data[0].phone;
          this.address = res.data[0].address;
          this.birthday = res.data[0].birthday;
          this.label = res.data[0].label;
        })
        .catch(err => {
          console.log(err);
        });
    },
    setUser() {
      if (
        this.sex == "" ||
        this.birthday == null ||
        this.label == "" ||
        this.phone == "" ||
        this.address == ""
      ) {
        this.$message("个人资料不能留空！");
        return;
      }
      this.axios({
        method: "post",
        url: "/login/setuser",
        data: this.qs.stringify({
          sex: this.sex,
          phone: this.phone,
          address: this.address,
          birthday: this.age,
          label: this.label,
          name: this.name
        })
      })
        .then(res => {
          if (res.data == "success") {
            this.$message.success("资料修改成功！");
            this.zlShow();
            this.getUser();
          } else {
            tis.$message.error("资料修改失败！");
          }
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  watch: {
    birthday(n, o) {
      let date = new Date(n);
      this.age =
        date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
    }
  }
};
</script>

<style scoped>
.user-top > .user-img img {
  border-radius: 50%;
  width: 100%;
  height: 70%;
  margin-bottom: 10px;
}
.user-title {
  width: 80%;
  margin: 0px auto 30px auto;
}
.user-top,
.user-main {
  padding: 20px;
  width: 80%;
  margin: 0 auto;
  border: 1px solid #218838;
  border-radius: 15px;
}
.user-top i {
  color: #218838 !important;
  cursor: pointer;
}
.user-main {
  margin-top: 30px;
}
.user-main > .col-12 {
  margin: 10px;
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
  height: 410px;
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