<template>
    <div id="detail-swiper">
       <swiper class="swiper" :options="swiperOption" v-if="detailGoods.image1.length>1">
           <swiper-slide class="swiperslid" v-for="(item,index) in detailGoods.image1" :key="index">
               <img :src="item">
           </swiper-slide>
           <div class="swiper-pagination" slot="pagination"></div>
       </swiper>
    </div>
</template>

<script>
    import 'swiper/dist/css/swiper.css';
    import {swiper,swiperSlide} from 'vue-awesome-swiper'
    export default {
        name: "DetailSwiper",
        components: {
            swiper,
            swiperSlide
        },
        data(){
            return {
                swiperOption: {
                    loop: true,
                    autoplay: {
                      disableOnInteraction: false,
                      stopOnLastSlide: false,
                      delay:1800
                    },
                    speed:1800,
                    notNextTick: true,
                    pagination: {
                        el:'.swiper-pagination',
                        clickable: true,
                        type: "bullets"
                    },
                    direction: 'horizontal',
                    observe: true,
                    observeParents: true
                },
                reRender: false
            }
        },
        props: {
            detailGoods: {
                type: Object,
                default(){
                    return []
                }
            }
        },
       mounted() {
           this.swiperOption.autoplay = true
       },
       activated() {

       }
    }
</script>

<style scoped>
  #detail-swiper{
      background: #eee
  }
   .swiper img {
       width: 100%;
       height: 450px;
       overflow: hidden;
   }
</style>
