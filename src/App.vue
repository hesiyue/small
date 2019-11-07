<template>
  <div id="app">
      <keep-alive exclude="Detail">
<!--          keep-alive可以保证组件不被销毁-->
          <router-view></router-view>
      </keep-alive>
   <main-tab-bar></main-tab-bar>
  </div>
</template>



<script>

    import MainTabBar from "./components/content/mainTabBar/MainTabBar";

  export default {
    components: {MainTabBar}
  }

</script>


<style>
  @import "assets/css/base.css";
  #app {
      position: relative;
  }




</style>
