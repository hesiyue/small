<template>
    <div id="wraper">
        <swiper class="swiper" :options="swiperOption" ref="mySwiper" v-if="imgArray.length>1">
            <swiper-slide class="swiperslid" v-for="(item,index) in imgArray" :key="index">
                <img :src="item">
            </swiper-slide>
            <div class="swiper-pagination" slot="pagination"></div>
        </swiper>
    </div>
</template>

<script>
    import 'swiper/dist/css/swiper.css';
    import {swiper,swiperSlide} from "vue-awesome-swiper"
    export default {
        name: "HomeSwiper",
        components: {
            swiper,swiperSlide
        },
        data(){
            return {
                imgArray: [
                    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572358959869&di=865bc2704d093506a909bbd3e5551b81&imgtype=0&src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farticle%2F7e3d9e93d6dd5477098bfc0a191ba1db0f62befc.jpg',
                    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2864665985,969111474&fm=26&gp=0.jpg',
                    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2108058674,2193935896&fm=26&gp=0.jpg'
                ],
                swiperOption: {
                    loop: true,
                    autoplay:true,
                    notNextTick: true,
                    speed: 800,
                    pagination: {
                        el: ".swiper-pagination",
                        clickable: true
                    },

                    pagination: {
                        el:'.swiper-pagination',
                        clickable: true,
                        type: "bullets"
                    },
                    direction: 'horizontal',
                    observe: true,
                    observeParents: true
                }
            }
        },
        computed: {

        }
    }
</script>

<style scoped>
    #wraper {
        width: 100%;
        height: 240px;
        padding-bottom:30.48%;
        background: #eee

    }
    .swiperslid img {
        width: 100%;
        height: 240px;
    }
</style>
