<template>
  <div>
    <!--   操作面板   -->
    <el-card class="goods-card">
      <div>
        <el-input
          v-model="param.searchKey"
          style="width: 240px"
          @keyup.enter.native="refresh(1)"
          placeholder="内容"
        ></el-input>
        <el-button type="primary" icon="el-icon-search" @click="refresh(1)">搜索</el-button>
      </div>
    </el-card>
    <el-card class="main-card">
      <el-row>
        <el-col :span="8" v-for="(item, index) in list" :key="item.id">
          <el-card style="padding:0px;margin:2px">
            <img :src="item.img_guid" />
            <div style="padding: 14px;">
              <div>
                <el-tag>{{ item.name }}</el-tag>
                <br /><br />
                <span style="font-size: 20px;">当前最低价格：</span>
                <span style="color: #ff6a00; font-size: 20px;">￥{{ item.price }}</span>
              </div>
              <br />
              <div style="color: #d39696">{{ item.detail }}</div>
              <div class="bottom clearfix">
                <!-- 添加 "收藏商品" 按钮 -->
                <el-button
                  class="button button-add-cart"
                  icon="el-icon-star-on"
                  type="success"
                  @click="addCart(item)"
                >
                  收藏商品
                </el-button>
                <!-- 保留 "查看详情" 按钮 -->
                <el-button
                  class="button button-view-details"
                  icon="el-icon-view"
                  type="primary"
                  @click="viewDetails(item)"
                >
                  查看详情
                </el-button>
              </div>
            </div>
          </el-card>
        </el-col>
      </el-row>
      <!--   分页  -->
      <div>
        <el-pagination
          background
          layout="prev, pager, next"
          :total="pagination.total"
          :page-size="pagination.pageSize"
          :current-page="pagination.currentPage"
          @current-change="pageChange"
        ></el-pagination>
      </div>
    </el-card>
  </div>
</template>

<script>
export default {
  data() {
    return {
      types: [],
      param: {
        page: 1,
        searchKey: '',
        searchType: '',
      },
      list: [],
      pagination: {
        total: 1,
        pageSize: 9,
        currentPage: 1,
      },
      addParam: {
        fid: null,
        flower: '',
        account: window.sessionStorage.getItem('token'),
      },
    };
  },
  methods: {
    pageChange(page) {
      this.refresh(page);
    },
    viewDetails(item) {
      // 使用路由导航到商品详情页面，传递商品ID作为参数
      this.$router.push({ path: '/user/productdetail', query: { id: item.id } });
    },
    addCart(item) {
      this.addParam.fid = item.id;
      this.addParam.flower = item.name;
      // 发送 POST 请求添加商品到购物车
      this.$http
        .post('/cart/create', this.addParam)
        .then((result) => {
          let R = result.data; // R
          if (R.code === 2000) {
            this.$message.success(R.msg);
          } else {
            this.$message.error(R.msg);
          }
        })
        .catch((error) => {
          this.$message.error('收藏商品失败');
          console.error(error);
        });
    },
    refresh(page) {
      if (page === undefined) {
        page = 1;
      }
      this.$http
        .get(
          '/flower/find?page=' +
            page +
            '&searchKey=' +
            this.param.searchKey +
            '&searchType=' +
            this.param.searchType
        )
        .then((result) => {
          let R = result.data;
          this.list = R.data.items;
          console.log(this.list);
          this.pagination.total = R.data.len;
          this.pagination.currentPage = page;
        });
    },
  },
  created() {
    this.refresh(1);
  },
};
</script>

<style scoped>
.search-input {
  width: 300px;
}

.updateForm {
  width: 80%;
}

.btn-release {
  float: right;
  margin-top: 10px;
  margin-right: 50px;
}

.form-releaseTask {
  height: 300px;
}

.input-content-task {
  width: 500px;
}

img {
  margin-top: 10px;
  width: 160px;
  height: 160px;
}

.main-card {
  background: #b3c0d1;
}

.button-add-cart {
  float: right;
  margin: 5px;
}

.button-view-details {
  float: right;
  margin: 5px;
}
</style>
