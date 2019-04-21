<template>
  <div>
    <div class="form-main">
      <el-breadcrumb separator-class="el-icon-arrow-right" class="release">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>个人中心</el-breadcrumb-item>
        <el-breadcrumb-item>发布闲置</el-breadcrumb-item>
      </el-breadcrumb>
      <div class="form-group">
        <label>宝贝名称：</label>
        <input type="text" class="form-control" v-model="name">
      </div>
      <div class="row">
        <div class="form-group col-4">
          <label>省份选择：</label>
          <select @change="clProvinces" class="form-control">
            <option value="xz" selected>请选择省份</option>
            <option
              v-for="(item,index) of provinces"
              :value="index+','+item.provinceName"
              :key="item.id"
            >{{item.provinceName}}</option>
          </select>
        </div>
        <div class="form-group col-4">
          <label>地市选择：</label>
          <select @change="clCitys" class="form-control">
            <option selected>请选择地市</option>
            <option v-for="item of citys" :value="item.citysName" :key="item.id">{{item.citysName}}</option>
          </select>
        </div>
        <div class="form-group col-4">
          <label>联系电话：</label>
          <input type="text" class="form-control" v-model="phone" maxlength="11">
        </div>
      </div>
      <div class="row">
        <div class="form-group col-4">
          <label>成色：</label>
          <select v-model="color" class="form-control">
            <option value="全新" selected>全新</option>
            <option value="99新">99新</option>
            <option value="95新">95新</option>
            <option value="90新">90新</option>
            <option value="85新">85新</option>
            <option value="80新及以下">80新及以下</option>
          </select>
        </div>
        <div class="form-group col-4">
          <label>宝贝分类：</label>
          <select v-model="gclass" class="form-control">
            <option value="phone" selected>手机</option>
            <option value="sm">数码</option>
            <option value="fs">服饰</option>
            <option value="jj">家具</option>
            <option value="mz">美妆</option>
            <option value="yd">运动</option>
            <option value="jd">家电</option>
            <option value="other">其他</option>
          </select>
        </div>
        <div class="form-group col-4">
          <label>价格：</label>
          <input type="text" class="form-control" v-model="price">
        </div>
      </div>
      <label>交易方式(按住 shift 键，可以选取多个选项)：</label>
      <select multiple class="form-control" v-model="paystyle" style="height:80px;">
        <option value="在线交易">在线交易</option>
        <option value="当面交易">当面交易</option>
        <option value="上门自提">上门自提</option>
      </select>
      <p>选择宝贝图片：</p>
      <div class="custom-file">
        <input
          type="file"
          accept="image/*"
          class="custom-file-input"
          id="customFile"
          @change="getFile"
        >
        <label class="custom-file-label" for="customFile">{{file.name}}</label>
      </div>
      <div class="form-group" style="margin-top:2%">
        <label for="comment">宝贝描述:</label>
        <textarea v-model="desc" class="form-control" rows="5" id="comment"></textarea>
      </div>
      <div>
        <button class="btn btn-success" @click="addGoods" style="margin-left:20%;">发布</button>
        <button class="btn btn-dark" @click="clAll" style="margin-left:40%;">重置</button>
      </div>
    </div>
  </div>
</template>

<script>
import allAddress from "@/assets/json/address.json";
export default {
  name: "ReleAse",
  data() {
    return {
      address: "",
      name: "",
      price: "",
      color: "全新",
      phone: "",
      paystyle: ["在线交易"],
      gclass: "phone",
      user: "",
      desc: "",
      file: "",
      provinces: [],
      citys: [],
      province: "",
      city: "",
      num: 0
    };
  },
  mounted() {
    if (this.$cookies.get("username") == null) {
      this.$message("请先登录！");
      setTimeout(() => {
        window.location.pathname = "/";
      }, 3000);
    } else {
      this.provinces = allAddress.provinces;
      this.user = this.$cookies.get("username");
    }
  },
  methods: {
    clProvinces(event) {
      let arr = event.target.value;
      if (arr != "xz") {
        this.num = arr.split(",")[0];
        this.address = arr.split(",")[1];
        this.city = this.address;
        this.citys = allAddress.provinces[this.num].citys;
      } else {
        this.citys = [];
      }
    },
    clCitys(event) {
      this.address = "";
      this.address = this.city + event.target.value;
    },
    clAll() {
      this.name = "";
      this.phone = "";
      this.price = "";
      this.color = "全新";
      this.gclass = "phone";
      this.file = "";
      this.desc = "";
      this.paystyle = ["在线交易"];
    },
    getFile(e) {
      this.file = e.target.files[0];
    },
    addGoods() {
      if (
        this.file == "" ||
        this.name == "" ||
        this.provinces == "" ||
        this.citys == "" ||
        this.phone == "" ||
        this.price == "" ||
        this.color == "" ||
        this.gclass == "" ||
        this.desc == "" ||
        this.paystyle == []
      ) {
        this.$message.warning("宝贝详情不能留空！");
      } else if (this.$cookies.get("username") == null) {
        this.$message.warning("身份信息已过期，请重新登录！");
      } else {
        let Form = new FormData();
        Form.append("img", this.file);
        Form.append("name", this.name);
        Form.append("price", this.price);
        Form.append("user", this.user);
        Form.append("color", this.color);
        Form.append("phone", this.phone);
        Form.append("address", this.address);
        Form.append("gclass", this.gclass);
        Form.append("desc", this.desc);
        Form.append("paystyle", this.paystyle);
        this.axios({
          method: "post",
          url: "/addgoods",
          data: Form,
          headers: {
            "content-type": "multipart/form-data"
          }
        })
          .then(res => {
            if (res.data == "success") {
              this.$message.success("宝贝发布成功！");
              this.clAll();
            } else {
              this.$message.error("宝贝发布失败！");
            }
          })
          .catch(err => {
            console.log(err);
          });
      }
    }
  }
};
</script>

<style scoped>
.form-main {
  width: 80%;
  margin: 0 auto;
}
.release {
  margin-bottom: 30px;
}
</style>