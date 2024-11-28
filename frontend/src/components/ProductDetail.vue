<template>
  <div class="product-detail">
    <h2>商品详情页面</h2>
    <p>商品ID：{{ productId }}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      productId: null,
    };
  },
  created() {
    // 从路由的 query 参数中获取商品ID
    this.productId = this.$route.query.id;

    // 如果没有提供商品ID，显示错误信息
    if (!this.productId) {
      this.$message.error('未提供商品ID');
    }
  },
};
</script>

<style scoped>
.product-detail {
  margin: 20px;
  font-size: 18px;
}
</style>
