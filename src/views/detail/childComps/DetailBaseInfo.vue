<template>
  <div v-if="Object.keys(goods).length !==0" class="base-info">
     <div class="info-title">{{goods.title}}</div>
     <div class="info-price">
          <span class="price">{{goods.price}}</span>
          <span class="oldPrice">{{goods.oldPrice}}</span>
     </div>
     <div class="info-other">
         <span>{{goods.columns[0]}}</span>
         <span>{{goods.columns[1]}}</span>
         <span>{{goods.columns[2]}}</span>
     </div>
  </div>
</template>

<script>
    export default {
        name: "DetailBaseInfo",
        props: {
            goods: {
                type: Object,
                default(){
                    return {}
                }
            }
        }
    }
</script>

<style scoped>
    .base-info {
        margin-top: 15px;
        padding: 0 8px;
        color: #999;
        border-bottom: 5px solid #f2f5f8;
    }

    .info-title {
        color: #222
    }

    .info-price {
        margin-top: 10px;
    }

    .info-price .price {
        font-size: 24px;
        color: var(--color-high-text);
    }

    .info-price .oldPrice {
        font-size: 13px;
        margin-left: 5px;
        text-decoration: line-through;
    }

    .info-other {
        margin-top: 15px;
        line-height: 30px;
        display: flex;
        font-size: 13px;
        border-bottom: 1px solid rgba(100,100,100,.1);
        justify-content: space-between;
    }
</style>
