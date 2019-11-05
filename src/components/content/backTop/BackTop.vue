<template>
    <div class="back-top">
        <img src="~assets/img/common/top.png">
    </div>
</template>

<script>
    export default {
        name: "BackTop",
        methods: {

        }
    }
</script>

<style scoped>
 .back-top {
      position: fixed;
      right: 10px;
      bottom: 55px;
      /*z-index的作用：如果不想让图片被覆盖而强制显示出来则要设置z-index的大小*/
      z-index: 9;

  }
  .back-top img {
      width: 43px;
      height: 43px;
  }
</style>
