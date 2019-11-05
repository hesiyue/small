<template>
    <div id="nav-bar">
        <div class="nav-left"><slot name="left"></slot> </div>
        <div class="nav-center"><slot name="center"></slot> </div>
        <div class="nav-right"><slot name="right"></slot> </div>

    </div>
</template>

<script>
    export default {
        name: "NavBar"
    }
</script>

<style scoped>
  #nav-bar{
      position: relative;
      z-index: 10;
      /*display调整摆放的样式，这里调整为水平摆放插槽slot*/
      display: flex;
      height: 44px;
      line-height: 44px;
      text-align: center;

  }
    .nav-left{
        width: 60px;
    }
    .nav-center{
        /* flex为1的意思是占据剩下的所有空间*/
       flex: 1;
    }
    .nav-right{
        width: 60px;
    }
</style>
