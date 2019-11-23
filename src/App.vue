<template>
  <div id="app">
      <keep-alive exclude="Detail">
<!--          keep-alive可以保证组件不被销毁-->
          <router-view></router-view>
      </keep-alive>
   <main-tab-bar></main-tab-bar>
      <icon></icon>
      <svg-icon></svg-icon>
</div>
</template>



<script>

    import MainTabBar from "./components/content/mainTabBar/MainTabBar";
    import Icon from 'content/Icon/Icon.vue'
    import SvgIcon from 'content/Icon/svg.vue'
    export default {
        components: {MainTabBar,Icon,SvgIcon}
    }

</script>


<style>
  @import "assets/css/base.css";
  #app {
      position: relative;
  }




</style>
