<template>
    <div class="user-info">
      <div class="clear-fix">
          <slot name="user-icon">
              <svg class="privateImage-svg left">
                  <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#avatar-default"></use>
              </svg>
          </slot>
          <div class="login-info left" >
              <slot name="user-nickname">
                  <div v-if="loginSuccess" @click="toLogin">登录/注册</div>
                  <div v-else>{{userName}}</div>
              </slot>
              <div class="phone">
                  <span>
                      <svg data-v-735ff1be="" fill="#fff" class="icon-mobile"><use data-v-735ff1be="" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#mobile"></use></svg>
                  </span>
                  <slot name="user-phone">暂无绑定手机号</slot>
              </div>
          </div>
          <slot data-v-735ff1be="" fill="#fff" class="arrow-svg right"><use data-v-735ff1be="" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#arrow-right"></use></slot>
      </div>
    </div>
</template>

<script>
    import {mapGetters} from 'vuex'
    export default {
        name: "UserInfo",
        data(){
            return {
            }
        },
        methods: {
            toLogin(){
                this.$router.push('/login')
            },
        },
        computed: {
            loginSuccess(){
              return   this.$store.state.Authorization === ''
            },
            userName(){
                return this.$store.state.userInfo.username
            }

        },

    }
</script>

<style scoped>
  .user-info {
      background-color: var(--color-tint);
      padding: 15px;
      margin-top: -5px;
  }
  .privateImage-svg {
      width: 60px;
      height: 60px;
      background-color: #fff;
      border-radius: 30px;
  }
  .left {
      float: left;
  }

  .arrow-svg {
      width: 11px;
      height: 22px;
      margin-top: 18px;
  }
  .login-info {
      color: #fff;
      margin: 10px 0 0 10px;
  }
  .phone {
      position: relative;

      font-size: 13px;
      margin-top: 5px;
      margin-left: 15px;
      font-weight: 300;
  }

  .icon-mobile {
      position: absolute;
      width: 12px;
      height: 18px;
      left: -15px;
      top: 0px;
  }


</style>
