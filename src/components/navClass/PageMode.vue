<template>
  <div class="block text-center page">
    <el-pagination
      background
      @current-change="pageChange"
      :current-page="currentPage"
      :page-size="display"
      layout="total, prev, pager, next, jumper"
      :total="total"
      prev-text="上一页"
      next-text="下一页"
    ></el-pagination>
  </div>
</template>

<script>
export default {
  name: "PageMode",
  data() {
    return {};
  },
  props: {
    total: {
      type: Number,
      default: 0
    },
    currentPage: {
      type: Number,
      default: 1
    },
    display: {
      type: Number,
      default: 8
    }
  },
  methods: {
    pageChange(index) {
      // this.currentPage = index;
      this.$emit("pageChange", index);
    }
  }
};
</script>

<style>
.page {
  margin-top: 40px;
  margin-bottom: 80px;
}
.el-pagination .el-pager .active {
  background-color: #ffd84d !important;
}
</style>