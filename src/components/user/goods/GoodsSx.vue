<template>
  <div>
    <div class="row goods_sx_title">
      <el-breadcrumb separator-class="el-icon-arrow-right" class="release">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>个人中心</el-breadcrumb-item>
        <el-breadcrumb-item>宝贝管理</el-breadcrumb-item>
        <el-breadcrumb-item>上架/下架</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div v-loading="loading2" class="row goods_sx_top text-center">
      <div class="err text-center" v-if="err">
        <img src="/static/images/nothing.png">
        <p>你还没有发布闲置，请先去发布宝贝再来哦！</p>
      </div>
      <table class="table" v-if="!err">
        <thead>
          <tr>
            <th>宝贝主图</th>
            <th>宝贝名称</th>
            <th>宝贝价格</th>
            <th>宝贝状态</th>
            <th>更改状态</th>
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
            <td>{{item.status}}</td>
            <td>
              <button class="btn btn-success btn-sm" @click="showme(item.id,item.status)">更改</button>
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
    <el-dialog title="提示" :visible.sync="dialogVisible" width="30%">
      <span>确定要{{goodsStatus}}宝贝吗？</span>
      <span slot="footer" class="dialog-footer">
        <button class="btn-success btn" @click="setStatus">确 定</button>
        <button class="btn btn-dark" @click="dialogVisible = false">取 消</button>
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
      goodsStatus: "下架",
      dialogVisible: false,
      gid: 0,
      st: "已上架",
      loading2: true,
      err: false
    };
  },
  mounted() {
    this.getTotal();
    this.getGoods();
  },
  methods: {
    showme(gid, st) {
      this.dialogVisible = true;
      this.gid = gid;
      this.st = st == "已上架" ? "已下架" : "已上架";
      this.goodsStatus = st == "已上架" ? "下架" : "上架";
    },
    getGoods() {
      this.axios({
        method: "get",
        url: "/goods/sx",
        params: {
          name: this.$cookies.get("username"),
          row: this.row,
          display: this.display
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
        url: "/goods/sx/total",
        params: {
          name: this.$cookies.get("username")
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
    },
    setStatus(id, st) {
      this.axios({
        method: "get",
        url: "/goods/sx/setstatus",
        params: {
          goodsid: this.gid,
          goodsstatus: this.st
        }
      })
        .then(res => {
          if (res.data == "success") {
            this.$message.success("宝贝" + this.goodsStatus + "成功！");
            this.getGoods();
          } else {
            this.$message.error("宝贝" + this.goodsStatus + "失败！");
          }
        })
        .catch(err => {
          console.log(err);
        });
      this.dialogVisible = false;
    }
  },
  components: {
    PageMode
  }
};
</script>

<style scoped>
.goods_sx_title,
.goods_sx_top {
  width: 80%;
  margin: 0 auto 30px auto;
}
.goods_sx_top table {
  min-height: 300px;
}
.goods_sx_top th {
  width: 20%;
}
.goods_sx_top > table > tbody > tr > td {
  height: 168px;
  vertical-align: middle;
}
.err{
  margin: 60px auto;
  color: #9c9c9c;
  width: 320px;
}
.goods-img{
  width: 70%;
  height: 150px;
} 
</style>
