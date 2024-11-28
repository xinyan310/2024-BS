<!--
 * 网站首页

-->
<template>
  <div>
    <!--   操作面板   -->
    <el-card class="goods-card">
      <div>
        <el-input v-model="param.searchKey" style="width: 240px" @keyup.enter.native="refresh(1)"
                  placeholder="内容"></el-input>
        <el-button type="primary" icon="el-icon-search" @click="refresh(1)">搜索</el-button>
      </div>
    </el-card>
    <el-card class="main-card">
      <el-row>
        <el-col :span="8" v-for="(o, index) in list" :key="o" :offset="0.1">
          <el-card style="padding:0px;margin:2px">
            <img v-if=" list[index].img_guid==='static/imgs/'" src="static/imgs/back.jpg">
            <img v-if=" list[index].img_guid.indexOf('.jpg') !== -1" :src="list[index].img_guid">
            <div style="padding: 14px;">
              <div><el-tag>{{list[index].name}}</el-tag>
                <br><br>
                <span style="font-size: 20px;">价格：</span><span style="color: #ff6a00;font-size: 20px;">￥{{list[index].price}}</span>
              </div>

              <br>
              <div style="color: #d39696">{{list[index].detail}}</div>


            </div>
          </el-card>
        </el-col>
      </el-row>

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
      }
    },
    methods: {
      pageChange(page) {
        this.refresh(page);
      },
      refresh(page) {
        if (page === undefined) {
          page = 1;
        }

        this.$http.get("/flower/find?page=" + page + "&searchKey=" + this.param.searchKey
          + "&searchType=" + this.param.searchType
        ).then(result => {
          let R = result.data;
          this.list = R.data.items;
          this.pagination.total = R.data.len;
          this.pagination.currentPage = page;
        })
      },
    },
    created() {
      this.refresh(1);
    }
  }
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
    background: #B3C0D1;
  }
  .button-add-cart{
    float: right;
    margin: 5px;
  }
</style>
