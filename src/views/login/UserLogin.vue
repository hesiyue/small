<template>
	<div class="db_login">
		<nav-bar class="nav-bar">
			<div slot="left" @click="goBack">返回</div>
			<div slot="center">登陆商城</div>
		</nav-bar>
		<div class="db_login_form">
			<form>
				<p class="form_item"><input type="text"  v-model="loginForm.username" placeholder="邮箱/手机号/用户名"></p>
				<p class="form_item"><input type="password" v-model="loginForm.password" placeholder="密码"></p>
				<p class="form_btn"><input type="button" value="登录" @click="login"></p>
			</form>
		</div>
		<div class="login_other">使用其它方式登录 & 找回密码</div>
		<div class="regist_download">
			<a @click="register">注册用户</a><a href="#">下载App</a>
		</div>
	</div>
</template>
<script>
	import NavBar from "components/common/navbar/NavBar";
	import {mapMutations} from 'vuex'
	export default {
		name: "UserLogin",
		components: {
			NavBar
		},
		data(){
			return {
		       loginForm: {
		       	username: '',
				password: ''
			   }
			}
		},
		methods: {
			...mapMutations(['changeLogin']),
			goBack(){
				this.$router.go(-1);
			},
			login(){
				this.$axios
						.post('/login',{
							username: this.loginForm.username,
							password: this.loginForm.password
						}).then(res=>{
					if(res.data.code===200)
					{
						this.userToken = res.data.userID;
						this.changeLogin(this.userToken)
						this.$store.commit('getUserInfo',res.data.userEntity)
						// console.log(this.$store.state.userInfo);
						this.$router.replace('/info')
					}
					else
						this.$toast('登录失败',2000)
				})
			},
			register(){
				this.$router.push('/register')
			}
		}
	}
</script>
<style scoped>
	.db_login {
		font-size: 16px;

	}
	.nav-bar {

	}
	.db_login .db_login_form{
		padding: 0 15px;
		margin: 25px 0 5px;
	}
	.db_login .db_login_form .form_item{
		height: 45px;
		line-height: 45px;
		padding: 0 10px;
		margin-bottom: -1px;
		box-sizing: border-box;
		border: 1px solid #e0e0e0;
	}
	.db_login .form_item:nth-of-type(1){
		border-top-left-radius: 3px;
		border-top-right-radius: 3px;
	}
	.db_login .form_item:nth-of-type(2){
		border-bottom-left-radius: 3px;
		border-bottom-right-radius: 3px;
	}
	.db_login .db_login_form input{
		border: none;
	}
	.db_login .db_login_form .form_btn{
		margin-top: 10px;
	}
	.db_login .form_btn input{
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
		border: 0;
		width: 100%;
		height: 40px;
		line-height: 40px;
		text-align: center;
		color: #fff;
		font-size: 14px;
		background-color: #17AA52;
		border-radius: 3px;
	}
	.db_login .login_other{
		color: #9d9d9d;
		text-align: center;
		margin-top: 15px;
	}
	.db_login .regist_download{
		text-align: center;
		margin-top: 40px;
	}
	.db_login .regist_download a{
		color: #42bd56;
		font-size: 14px;
		margin: 0 10px;
	}
</style>
