<template>
    <div id="info">
        <form>
            <label for="username">用户名：</label> <input type="text" v-model="loginForm.username"  placeholder="请输入用户名"><br>
            <label for="password">密码:</label><input type="password" v-model="loginForm.password" placeholder="请输入密码"><br>
            <input type="button" value="登录" @click="login">
        </form>
    </div>
</template>

<script>
    export default {
        name: "Info",
        data(){
            return {
               loginForm: {
                   username: '',
                   password: ''
               }
            }
        },
        methods: {
          login(){
             this.$axios
                 .post('/login',{
                     username: this.loginForm.username,
                     password: this.loginForm.password
                 }).then(successResponse=>{
                     if(successResponse.data.code===200)
                         this.$router.replace('/home')
                     else
                         console.log('没找到对应数据');
             }).catch(failResponse =>{})

          }
        },
    }
</script>

<style scoped>

</style>
