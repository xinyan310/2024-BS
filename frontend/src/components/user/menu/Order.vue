<template>
  <div>
    <!-- 操作面板 -->
    <el-card>
      <div class="header">
        <h2 class="my-title">商品查价</h2>
        <div class="search">
          <el-input
            v-model="searchKey"
            style="width: 240px"
            @keyup.enter.native="searchProduct"
            placeholder="请输入商品名称"
          ></el-input>
          <el-button type="primary" icon="el-icon-search" @click="searchProduct"
            >搜索</el-button
          >
        </div>
      </div>
    </el-card>
    <!-- 查询结果面板 -->
    <el-card v-if="searchResult">
      <h3>查询结果：</h3>
      <el-table :data="[searchResult]" class="my-el-table">
        <el-table-column prop="name" label="商品名称" align="center"></el-table-column>
        <el-table-column prop="price" label="价格" align="center"></el-table-column>
        <el-table-column label="操作" align="center">
          <template slot-scope="scope">
            <el-button type="success" @click="openAddDialog(scope.row)"
              >添加到商品库</el-button
            >
          </template>
        </el-table-column>
      </el-table>
    </el-card>
    <!-- 添加商品对话框 -->
    <el-dialog
      title="添加商品到商品库"
      :visible.sync="addDialogVisible"
      width="50%"
    >
      <div>
        <el-form :model="addProduct" label-width="80px" size="small">
          <el-form-item label="名称">
            <el-input class="small-input" v-model="addProduct.name"></el-input>
          </el-form-item>
          <el-form-item label="分类">
            <el-select v-model="addProduct.species_name" placeholder="请选择">
              <el-option
                v-for="item in species"
                :key="item.id"
                :label="item.species_name"
                :value="item.species_name"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="价格">
            <el-input
              class="small-input"
              type="number"
              v-model="addProduct.price"
            ></el-input>
          </el-form-item>
          <el-form-item label="详情">
            <el-input class="small-input" v-model="addProduct.detail"></el-input>
          </el-form-item>
          <div class="create-dialog-btn">
            <el-button type="primary" @click="doAddProduct">保存</el-button>
            <el-button type="warning" @click="cancelAdd">取消</el-button>
          </div>
        </el-form>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      searchKey: '',
      searchResult: null, // 存储查询结果
      addDialogVisible: false, // 控制添加商品对话框的显示
      species: [], // 商品分类列表，初始化为空数组
      addProduct: {
        name: '',
        species_name: '',
        price: '',
        detail: '',
      },
    };
  },
  methods: {
    // 模拟查询商品价格的接口
    searchProduct() {
      if (!this.searchKey) {
        this.$message.warning('请输入商品名称');
        return;
      }
      // 由于爬取功能未实现，这里模拟一个查询结果
      this.searchResult = {
        name: this.searchKey,
        price: '待获取', // 暂未获取价格
      };
      // 如果需要，可以在这里调用后端接口获取商品价格
      // this.$http.get('/api/searchProduct', { params: { name: this.searchKey } })
      //   .then(response => {
      //     this.searchResult = response.data;
      //   });
    },
    // 打开添加商品对话框
    openAddDialog(product) {
      // 将查询结果填入添加商品的表单
      this.addProduct.name = product.name;
      this.addProduct.price = product.price;
      this.addDialogVisible = true;
    },
    // 取消添加
    cancelAdd() {
      this.addDialogVisible = false;
      // 重置表单
      this.addProduct = {
        name: '',
        species_name: '',
        price: '',
        detail: '',
      };
    },
    // 执行添加商品操作
    doAddProduct() {
      // 验证表单
      if (!this.addProduct.name || !this.addProduct.species_name) {
        this.$message.warning('请填写完整的商品信息');
        return;
      }
      // 调用后端接口添加商品
      this.$http
        .post('/flower/create', this.addProduct)
        .then((result) => {
          let R = result.data;
          if (R.code === 2000) {
            this.$message.success(R.msg);
            this.addDialogVisible = false;
            // 重置表单
            this.addProduct = {
              name: '',
              species_name: '',
              price: '',
              detail: '',
            };
          } else {
            this.$message.error(R.msg);
          }
        })
        .catch((error) => {
          this.$message.error('添加商品失败');
          console.error(error);
        });
    },
  },
  created() {
    // 在组件创建时，从后端获取商品分类列表
    this.$http.get('/species/findAll').then((result) => {
      let R = result.data;
      if (R.code === 2000) {
        this.species = R.data;
      } else {
        this.$message.error('获取商品分类失败');
      }
    }).catch((error) => {
      this.$message.error('网络错误，无法获取商品分类');
      console.error(error);
    });
  },
};
</script>

<style scoped>
.my-title {
  font-size: 24px;
  /* margin-bottom: 10px; */
}

.header {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.search {
  /* margin-top: 10px; */
}

.my-el-table {
  margin-top: 20px;
}

.create-dialog-btn {
  text-align: right;
}

.small-input {
  width: 80%;
}
</style>
