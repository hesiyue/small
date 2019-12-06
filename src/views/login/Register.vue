<template>
    <div class="register">
        <nav-bar class="navbar">
            <div slot="left" @click="goBack">返回</div>
            <div slot="center">注册</div>
        </nav-bar>
       <form class="form">
         <input type="text" v-model="username" placeholder="请输入用户名" class="username"></input><br>
        <input type="password" v-model="password" placeholder="请输入密码" class="password"></input><br>
         <input type="button" value="注册" @click="toRegister" class="register_btn"></input>
       </form>

    </div>
</template>

<script>
    import NavBar from "../../components/common/navbar/NavBar";
    export default {
        name: "Register",
        components: {NavBar},
        data(){
            return {
                username: '',
                password: ''
            }
        },
        methods: {
            toRegister(){
                this.$axios.post('/register',{
                    username: this.username,
                    password: this.password
                }).then(res=>{
                    if(res.data.code===200)
                        this.$router.push('/login')
                    else if(res.data.code===401){
                        this.$toast("该用户已经存在，请重新注册")
                        this.username = ''
                        this.password = ''
                    }

                })
            },
            goBack(){
                this.$router.go(-1);
            },
        }
    }
</script>

<style scoped>
    .register {

    }
    .navbar {
        background-color: pink;
    }
    .form {

    }
    .username {
        width: 100%;
        height: 40px;
    }
    .password {
        width: 100%;
        height: 40px;
    }
    .register_btn {
        width: 100%;
        background-color: #17AA52;
        border-radius: 5px;
        height: 40px;
    }
</style>
