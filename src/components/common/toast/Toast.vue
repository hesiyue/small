<template>
    <div class="toast" v-if="showWrap" :class="showContent? 'fadein':'fadeout'">{{text}}</div>
</template>

<script>
    export default {
        name: "Toast"
    }
</script>

<style scoped>
  .toast {
      position: fixed;
      left:50%;
      top: 50%;
      height: 80px;
      background: #ff8198;
      border-radius: 5px;
      transform: translate(-50%,-50%);
      color: black;
      font-size: 25px;
      z-index: 9;
  }
  .fadein {
      animation: animate_in 0.25s;
  }
  .fadeout {
      animation: animate_out  0.25;
      opacity: 0;
  }

  @keyframes animate_in {
      0% {
          opacity: 0;
      }
      100% {
          opacity: 1;
      }
  }
  @keyframes animate_out {
      0% {
          opacity: 1;
      }
      100% {
          opacity: 0;
      }
  }

</style>
