<template>
  <div>
    <!-- 操作面板 -->
    <el-card>
      <div class="header">
        <h2 class="my-title">商品查价</h2>
        <div class="search">
          <el-button type="primary" icon="el-icon-refresh" @click="updateHistoryPrice">更新历史价格</el-button>
          <el-input
            v-model="searchKey"
            style="width: 240px"
            :placeholder="'请输入商品名称 (' + searchKey + ')'"
            disabled
          ></el-input>
          <el-button type="primary" icon="el-icon-edit" @click="openUpdateDialog">更新到商品库</el-button>
          <el-button type="primary" icon="el-icon-search" @click="searchProduct">搜索</el-button>
        </div>
      </div>
    </el-card>

    <!-- 查询结果面板 -->
    <el-row :gutter="20" v-if="searchResult && searchResult.length > 0">
      <!-- 使用el-card循环渲染每个商品 -->
      <el-col :span="6" v-for="(item, index) in searchResult" :key="index">
        <el-card :body-style="{ padding: '20px' }">
          <div class="product-item">
            <img :src="'/static/imgs/' + item.img_guid" alt="Product Image" class="product-img" />
            <div class="product-info">
              <h3>{{ item.name }}</h3>
              <p><strong>价格:</strong> {{ item.price }}</p>
              <p><strong>平台:</strong> {{ item.plat }}</p>
              <p><strong>详情:</strong> {{ item.detail }}</p>
              <p>
                <strong>链接:</strong>
                <a href="javascript:void(0);" @click="openLink(item.href)">链接</a>
              </p>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 没有结果时显示 -->
    <el-card v-else>
      <h3>没有找到商品</h3>
    </el-card>

    <!-- 更新商品对话框 -->
    <el-dialog
      title="更新商品到商品库"
      :visible.sync="updateDialogVisible"
      width="50%"
    >
      <div>
        <el-form :model="updateProduct" label-width="80px" size="small">
          <el-form-item label="名称">
            <el-input class="small-input" v-model="updateProduct.name" disabled></el-input>
          </el-form-item>
          <el-form-item label="分类">
            <el-select v-model="updateProduct.species_name" placeholder="请选择">
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
              v-model="updateProduct.price"
            ></el-input>
          </el-form-item>
          <el-form-item label="详情">
            <el-input class="small-input" v-model="updateProduct.detail"></el-input>
          </el-form-item>
          <el-form-item label="图片路径">
            <el-input class="small-input" v-model="updateProduct.img_guid"></el-input>
          </el-form-item>
          <div class="create-dialog-btn">
            <el-button type="primary" @click="doUpdateProduct">保存</el-button>
            <el-button type="warning" @click="cancelUpdate">取消</el-button>
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
      searchKey: '', // 搜索关键词
      searchResult: [], // 存储查询结果
      updateDialogVisible: false, // 控制更新商品对话框的显示
      species: [], // 商品分类列表
      updateProduct: {
        name: '',
        species_name: '',
        price: '',
        detail: '',
        img_guid: '',
      },
      loadingInstance: null, // 控制加载状态的实例
    };
  },
  created() {
    // 获取页面传递的商品名称参数并赋值给搜索框
    this.searchKey = this.$route.query.productName || ''; // 获取商品名称参数
    if (this.searchKey) {
      this.searchProduct();
    }

    // 获取商品分类列表
    this.$http
      .get('/species/findAll')
      .then((result) => {
        let R = result.data;
        if (R.code === 2000) {
          this.species = R.data;
        } else {
          this.$message.error('获取商品分类失败');
        }
      })
      .catch((error) => {
        this.$message.error('网络错误，无法获取商品分类');
        console.error(error);
      });
  },

  methods: {
    // 查询商品接口
    searchProduct() {
      if (!this.searchKey) {
        this.$message.warning('请输入商品名称');
        return;
      }

      // 显示加载提示
      this.loadingInstance = this.$loading({
        lock: true,
        text: '正在加载数据，请稍后...',
        spinner: 'el-icon-loading',
        background: 'rgba(0, 0, 0, 0.7)',
      });

      // 使用axios请求后端接口
      this.$http
        .get('http://127.0.0.1:5000/hello', { params: { name: this.searchKey } })
        .then((response) => {
          // 隐藏加载提示
          if (this.loadingInstance) {
            this.loadingInstance.close();
          }

          // 将返回的数据赋值给 searchResult
          console.log(response.data);
          this.searchResult = response.data.data || []; // 假设后端返回的是 data 数组
        })
        .catch((error) => {
          // 隐藏加载提示
          if (this.loadingInstance) {
            this.loadingInstance.close();
          }

          console.error('请求失败:', error);
          this.$message.error('请求失败');
        });
    },

    // 打开链接
    openLink(url) {
      window.open(url, '_blank'); // 在新窗口中打开链接
    },

    // 打开更新商品对话框并自动填充商品数据
    openUpdateDialog() {
      if (this.searchResult.length > 0) {
        const firstItem = this.searchResult[0]; // 获取第一个商品
        this.updateProduct.name = this.searchKey; // 设置名称为输入的关键词
        this.updateProduct.price = firstItem.price; // 设置价格为第一个商品的价格
        this.updateProduct.detail = firstItem.detail; // 设置详情为第一个商品的详情
        this.updateProduct.img_guid = firstItem.img_guid;
        this.updateDialogVisible = true; // 显示更新对话框
      } else {
        this.$message.warning('没有商品可以更新');
      }
    },

    // 更新商品到商品库
    doUpdateProduct() {
      if (!this.updateProduct.name || !this.updateProduct.species_name) {
        this.$message.warning('请填写完整的商品信息');
        return;
      }

      // 先删除对应商品名的记录
      this.$http
        .delete('/flower/delete', { params: { name: this.updateProduct.name } })
        .then(() => {
          // 删除成功后添加新的商品
          this.$http
            .post('/flower/create', this.updateProduct)
            .then((result) => {
              let R = result.data;
              if (R.code === 2000) {
                this.$message.success(R.msg);
                this.updateDialogVisible = false;
              } else {
                this.$message.error(R.msg);
              }
            })
            .catch((error) => {
              this.$message.error('添加商品失败');
              console.error(error);
            });
        })
        .catch((error) => {
          this.$message.error('删除商品失败');
          console.error(error);
        });
    },

    // 取消更新商品
    cancelUpdate() {
      this.updateDialogVisible = false;
      this.updateProduct = {
        name: '',
        species_name: '',
        price: '',
        detail: '',
        img_guid: '',
      };
    },

    // 更新历史价格功能，暂时没有实现
    updateHistoryPrice() {
      this.$message.info('更新历史价格功能尚未实现');
    },
  },
};
</script>

<style scoped>
.my-title {
  font-size: 24px;
}

.header {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.search {
  display: flex;
  align-items: center;
}

.search button {
  margin-right: 10px;
}

.product-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
}

.product-img {
  width: 100%;
  height: auto;
}

.product-info {
  margin-top: 10px;
}

.product-info h3 {
  font-size: 18px;
  font-weight: bold;
}

.product-info p {
  font-size: 14px;
  margin: 5px 0;
}

.create-dialog-btn {
  text-align: right;
}

.small-input {
  width: 80%;
}
</style>
