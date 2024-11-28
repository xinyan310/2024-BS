<template>
  <div class="whole">
    <div class="login">
      <div class="title" style="color: #ff6a00">
        <img src="../assets/imgs/logo2.png" style="width: 40px;position: relative; top: 13px;right: 0px"/>
        <span style="font-size: 20px">商品比价网站</span>
      </div>
      <div class="my-form">
        <el-form :model="loginForm" label-width="80px" status-icon size="small">
          <!-- 添加“账号”标签 -->
          <el-form-item label="账号" prop="account">
            <el-input type="text" prefix-icon="el-icon-user-solid" v-model="loginForm.account"></el-input>
          </el-form-item>
          <!-- 添加“密码”标签 -->
          <el-form-item label="密码" prop="password">
            <el-input
              type="password"
              prefix-icon="el-icon-s-cooperation"
              v-model="loginForm.password"
              autocomplete="off"
            ></el-input>
          </el-form-item>
          <el-form-item class="btns">
            <el-radio v-model="loginForm.role" label="user">用户</el-radio>
            <el-radio v-model="loginForm.role" label="admin">管理员</el-radio>
          </el-form-item>
          <el-form-item class="btns">
            <el-button type="primary" @click="login()">登录</el-button>
            <el-button type="warning" @click="reset()">重置</el-button>
            <el-button type="success" @click="create">注册</el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>
    <!--   注册   -->
    <div>
      <el-dialog
        title="注册用户"
        :visible.sync="createDialogVisible"
        width="30%"
        center
      >
        <div>
          <el-form :model="addUser" label-width="80px" size="small">
            <el-form-item label="账号">
              <el-input class="mid-input" v-model="addUser.account"></el-input>
            </el-form-item>
            <el-form-item label="姓名">
              <el-input class="mid-input" v-model="addUser.name"></el-input>
            </el-form-item>
            <el-form-item label="密码">
              <el-input class="mid-input" type="password" v-model="addUser.password"></el-input>
            </el-form-item>
            <el-form-item label="手机号">
              <el-input class="mid-input" v-model="addUser.phone"></el-input>
            </el-form-item>
            <el-form-item label="邮箱地址">
              <el-input class="mid-input" v-model="addUser.address"></el-input>
            </el-form-item>
            <div class="create-dialog-btn">
              <el-button type="primary" @click="doCreate">注册</el-button>
              <el-button type="warning" @click="cancel">取消</el-button>
            </div>
          </el-form>
        </div>
      </el-dialog>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Login',
  data() {
    return {
      createDialogVisible: false, // 控制注册对话框的显示状态
      addUser: {
        account: '',
        name: '',
        password: '',
        phone: '',
        address: ''
      },
      loginForm: {
        account: '',
        password: '',
        role: 'user',
      },
    }
  },
  methods: {
    // 打开注册对话框
    create() {
      this.reset(); // 重置表单
      this.createDialogVisible = true; // 显示注册对话框
    },
    // 验证注册信息
    verify(user) {
      // 检查是否有未填写的字段
      if (
        !user.account ||
        !user.name ||
        !user.password ||
        !user.phone ||
        !user.address
      ) {
        this.$message.warning('请填写完整的注册信息');
        return false;
      }
      // 用户名长度验证
      if (user.account.length < 6) {
        this.$message.warning('用户名长度需至少6个字符');
        return false;
      }
      // 密码长度验证
      if (user.password.length < 6) {
        this.$message.warning('密码长度需至少6个字符');
        return false;
      }
      // 邮箱格式验证
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailRegex.test(user.address)) {
        this.$message.warning('请输入有效的邮箱地址');
        return false;
      }
      // 手机号格式验证
      const phoneRegex = /^1[3-9]\d{9}$/;
      if (!phoneRegex.test(user.phone)) {
        this.$message.warning('请输入有效的手机号（11位数字，以1开头）');
        return false;
      }
      return true;
    },
    // 执行注册操作
    doCreate() {
      let flag = this.verify(this.addUser);
      if (flag) {
        this.$http.post("/user/create", this.addUser).then(result => {
          let R = result.data;
          if (R.code === 2000) {
            this.$message.success(R.msg);
            this.reset(); // 重置表单
            this.createDialogVisible = false; // 关闭注册对话框
          } else {
            this.$message.error(R.msg);
          }
        }).catch(error => {
          this.$message.error('注册失败');
          console.error(error);
        });
      }
    },
    // 取消注册
    cancel() {
      this.createDialogVisible = false; // 关闭注册对话框
    },
    // 重置表单
    reset() {
      this.addUser = {
        account: '',
        name: '',
        password: '',
        phone: '',
        address: ''
      };
    },
    // 登录方法
    login() {
      this.$http.post("/login/doLogin", this.loginForm).then(result => {
        let R = result.data;
        let user = R.data;
        if (R.code === 2000) {
          window.sessionStorage.setItem('token', user.account);
          window.sessionStorage.setItem('role', user.role);
          this.$message.success(R.msg);
          if (user.role === 'admin') {
            this.$router.push('/home');
          } else if (user.role === 'user') {
            this.$router.push('/user');
          } else {
            this.$router.push('/404');
          }
        } else {
          this.$message.error(R.msg);
        }
      }).catch(error => {
        this.$message.error('登录失败');
        console.error(error);
      });
    },
  }
}
</script>

<style scoped>
.whole {
  background-image: url("~@/assets/imgs/background.jpg");
  background-size: 100%;
  height: 100%;
}

.login {
  width: 450px;
  height: 300px;
  background-color: #fff;
  border-radius: 3px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  opacity: 0.95;
}

.my-form {
  margin-top: 75px;
  width: 300px;
  position: absolute;
  left: 50%;
  top: 36%;
  transform: translate(-50%, -50%);
}

.btns {
  text-align: center;
}

.title {
  margin-top: 20px;
  text-align: center;
  color: dodgerblue;
}

.el-form-item {
  margin-left: 5%;
}

.mid-input {
  width: 100%;
}

.create-dialog-btn {
  text-align: right;
}
</style>
