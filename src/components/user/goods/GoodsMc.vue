<template>
  <div>
    <div class="row goods_mc_title">
      <el-breadcrumb separator-class="el-icon-arrow-right" class="release">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>个人中心</el-breadcrumb-item>
        <el-breadcrumb-item>宝贝管理</el-breadcrumb-item>
        <el-breadcrumb-item>卖出历史</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div v-loading="loading2" class="row goods_mc_top text-center">
      <div class="err text-center" v-if="err">
        <img src="/static/images/nothing.png">
        <p>你还没有卖出的宝贝哦，先去发布吧！</p>
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
              <button class="btn btn-success btn-sm" @click="showme(item.id)">删除</button>
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
    <el-dialog title="提示" :visible.sync="deleteShow" width="30%">
      <span>确定要删除这条记录吗？</span>
      <span slot="footer" class="dialog-footer">
        <button class="btn-success btn" @click="deleteGoods">确 定</button>
        <button class="btn btn-dark" @click="deleteShow = false">取 消</button>
      </span>
    </el-dialog>
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
      deleteShow: false,
      err: false,
      gid: 0
    };
  },
  mounted() {
    this.getGoods();
    this.getTotal();
  },
  methods: {
    showme(value) {
      this.deleteShow = true;
      this.gid = value;
    },
    deleteGoods() {
      this.axios({
        method: "get",
        url: "/goods/delete_goods",
        params: {
          gid: this.gid
        }
      }).then(res => {
        if (res.data == "success") {
          this.$message.success("记录已删除！");
          this.getTotal();
          this.getGoods();
          this.deleteShow = false;
        } else {
          this.$message.error("记录删除失败！");
        }
      });
    },
    getGoods() {
      this.axios({
        method: "get",
        url: "/goods/status",
        params: {
          name: this.$cookies.get("username"),
          row: this.row,
          display: this.display,
          gstatus: "已下架"
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
          gstatus: "已下架"
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
    pageChange(index) {
      this.currentPage = index;
      this.row = (this.currentPage - 1) * this.display;
      this.getGoods();
    }
  },
  components: {
    PageMode
  }
};
</script>

<style scoped>
.goods_mc_title,
.goods_mc_top {
  width: 80%;
  margin: 0 auto 30px auto;
}
.goods_mc_top table {
  min-height: 300px;
}
.goods_mc_top th {
  width: 20%;
}
.goods_mc_top > table > tbody > tr > td {
  height: 168px;
  vertical-align: middle;
}
.err {
  margin: 60px auto;
  color: #9c9c9c;
  width: 320px;
}
.goods-img{
  width: 70%;
  height: 150px;
}
</style>