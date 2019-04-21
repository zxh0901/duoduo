<template>
  <div>
    <div class="row goods_cs_title">
      <el-breadcrumb separator-class="el-icon-arrow-right" class="release">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>个人中心</el-breadcrumb-item>
        <el-breadcrumb-item>宝贝管理</el-breadcrumb-item>
        <el-breadcrumb-item>正在出售</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div v-loading="loading2" class="row goods_cs_top text-center">
      <div class="err text-center" v-if="err">
        <img src="/static/images/nothing.png">
        <p>你还没有出售的闲置，赶紧去发布宝贝吧！</p>
      </div>
      <table class="table" v-if="!err">
        <thead>
          <tr>
            <th>宝贝主图</th>
            <th>宝贝名称</th>
            <th>宝贝价格</th>
            <th>宝贝成色</th>
            <th>宝贝管理</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="item of list" :key="item.id">
            <td>
              <router-link :to="'/glist?id='+item.id+'&gclass='+item.class">
                <img :src="'/static/images/goods/'+item.img" class="goods-img">
              </router-link>
            </td>
            <td>{{item.name}}</td>
            <td>￥{{item.price}}</td>
            <td>{{item.color}}</td>
            <td>
              <button class="btn btn-success btn-sm" @click="showme(item.id)">修改</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <page-mode
      @pageChange="pageChange"
      :total="total"
      :display="display"
      :currentPage="currentPage"
      v-if="!err"
    ></page-mode>
    <div class="zl" v-if="zl">
      <div class="zl-main">
        <div class="row">
          <h2 class="col-12">宝贝信息修改</h2>
          <div class="form-group col-4">
            <label>宝贝名称：</label>
            <input type="text" class="form-control" v-model="name">
          </div>
          <div class="form-group col-4">
            <label>发货地址：</label>
            <input type="text" class="form-control" v-model="address" maxlength="11">
          </div>
          <div class="form-group col-4">
            <label>联系电话：</label>
            <input type="text" class="form-control" v-model="phone" maxlength="11">
          </div>
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
          <div class="form-group col-6">
            <label>交易方式(按住 shift 键，可以选取多个选项)：</label>
            <select multiple class="form-control" v-model="paystyle" style="height:80px;">
              <option value="在线交易">在线交易</option>
              <option value="当面交易">当面交易</option>
              <option value="上门自提">上门自提</option>
            </select>
          </div>
          <div class="col-6">
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
          </div>
          <div class="form-group col-12" style="margin-top:2%">
            <label for="comment">宝贝描述:</label>
            <textarea v-model="desc" class="form-control" rows="5" id="comment"></textarea>
          </div>
          <div class="col-12">
            <div style="width:35%;float:right;">
              <button class="btn btn-success" @click="updateGoods">确定</button>
              <button class="btn btn-dark" @click="zlShow">取消</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import PageMode from "../../navClass/PageMode";
export default {
  data() {
    return {
      list: [],
      display: 8,
      row: 0,
      currentPage: 1,
      total: 0,
      loading2: true,
      updateShow: false,
      err: false,
      gid: 0,
      file: "",
      address: "",
      name: "",
      price: "",
      color: "全新",
      phone: "",
      paystyle: ["在线交易"],
      gclass: "phone",
      desc: "",
      zl: false
    };
  },
  mounted() {
    this.getGoods();
    this.getTotal();
  },
  methods: {
    zlShow() {
      this.zl = !this.zl;
    },
    showme(value) {
      this.updateShow = !this.updateShow;
      this.gid = value;
      this.getSingle();
      this.zlShow();
    },
    getGoods() {
      this.axios({
        method: "get",
        url: "/goods/status",
        params: {
          name: this.$cookies.get("username"),
          row: this.row,
          display: this.display,
          gstatus: "已上架"
        }
      })
        .then(res => {
          this.list = res.data;
          this.loading2 = false;
        })
        .catch(err => {
          console.log(err);
        });
    },
    getTotal() {
      this.axios({
        method: "get",
        url: "/goods/status/total",
        params: {
          name: this.$cookies.get("username"),
          gstatus: "已上架"
        }
      })
        .then(res => {
          this.total = res.data[0].sum;
          if (this.total == 0) {
            this.err = true;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    getSingle() {
      this.axios({
        method: "get",
        url: "/goods/list",
        params: {
          id: this.gid
        }
      })
        .then(res => {
          this.name = res.data[0].name;
          this.address = res.data[0].address;
          this.phone = res.data[0].phone;
          this.color = res.data[0].color;
          this.gclass = res.data[0].class;
          this.price = res.data[0].price;
          this.paystyle = res.data[0].paystyle.split(",");
          this.desc = res.data[0].gdesc;
        })
        .catch(err => {
          console.log(err);
        });
    },
    updateGoods() {
      if (this.file == "") {
        this.$message("宝贝信息不能留空！");
        return;
      }
      let Form = new FormData();
      Form.append("img", this.file);
      Form.append("name", this.name);
      Form.append("price", this.price);
      Form.append("gid", this.gid);
      Form.append("color", this.color);
      Form.append("phone", this.phone);
      Form.append("address", this.address);
      Form.append("gclass", this.gclass);
      Form.append("desc", this.desc);
      Form.append("paystyle", this.paystyle);
      this.axios({
        method: "post",
        url: "/goods/update_goods",
        data: Form,
        headers: {
          "content-type": "multipart/form-data"
        }
      })
        .then(res => {
          if (res.data == "success") {
            this.$message.success("宝贝信息修改成功！");
            this.getGoods();
            this.zl = false;
          } else {
            this.$message.error("宝贝信息修改失败！");
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    pageChange(index) {
      this.currentPage = index;
      this.row = (this.currentPage - 1) * this.display;
      this.getGoods();
    },
    getFile(e) {
      this.file = e.target.files[0];
    }
  },
  components: {
    PageMode
  }
};
</script>

<style scoped>
.goods_cs_title,
.goods_cs_top {
  width: 80%;
  margin: 0 auto 30px auto;
}
.goods_cs_top table {
  min-height: 300px;
}
.goods_cs_top th {
  width: 20%;
}
.goods_cs_top > table > tbody > tr > td {
  height: 168px;
  vertical-align: middle;
}
.err {
  margin: 60px auto;
  color: #9c9c9c;
  width: 320px;
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
  animation: topDown 0.4s;
  border-radius: 10px;
  overflow: auto;
  width: 70%;
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
.goods-img{
  width: 70%;
  height: 150px;
}
</style>