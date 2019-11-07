<template>
    <div class="detail" >
        <detail-nav-bar></detail-nav-bar>
        <scroll class="content">
            <detail-swiper :detail-goods="detailGoods"></detail-swiper>
            <detail-base-info :goods="detailGoods"></detail-base-info>
            <detail-shop-info :goods="detailGoods"></detail-shop-info>
            <detail-goods-info :detail-info="detailGoods"></detail-goods-info>
            <detail-param-info :param-info="detailGoods"></detail-param-info>
        </scroll>
    </div>
</template>

<script>
    import DetailNavBar from "./childComps/DetailNavBar";
    import DetailSwiper from "./childComps/DetailSwiper";
    import DetailBaseInfo from "./childComps/DetailBaseInfo";
    import DetailShopInfo from "./childComps/DetailShopInfo";
    import Scroll from "components/common/scroll/Scroll";
    import DetailGoodsInfo from "./childComps/DetailGoodsInfo";
    import DetailParamInfo from "./childComps/DetailParamInfo";

    export default {
        name: "Detail",
        components: {
            Scroll,
            DetailNavBar,
            DetailSwiper,
            DetailBaseInfo,
            DetailShopInfo,
            DetailGoodsInfo,
            DetailParamInfo
        },
        data(){
            return {
                id: null,
                detailGoods:{
                    id: 2,
                    title: '秋季新款法式复古中长款系绳收腰针织连衣裙宽松显廋打底毛衣裙子',
                    oldPrice:155,
                    price:109,
                    columns:['销量10042','收藏616人','退货补运费'],
                    desc:'该产品买五件打七折',
                    infos: [
                        ['图案','纯色'],
                        ['裙型', 'A字裙'],
                        ['颜色','杏色'],
                        ['裙长','中长裙'],
                        ['季节','秋袖'],
                        ['风格','淑女'],
                        ['潮流','韩系']
                    ],
                    tables:[
                        ['尺码','M','L','XL','XXL'],
                        ['衣长','61.5','63','64.5','66'],
                        ['胸围','98','104','110','116'],
                        ['袖长','63','66','68.5','70.5']
                    ],
                    shop: {
                        logo: 'https://s5.mogucdn.com/p1/160205/1xebxb_ifrtaytggq3wknzygyzdambqhayde_200x200.jpg_100x100.jpg_100x100.jpg',
                        shopUrl: 'https://shop.mogu.com/1p788q?ptp=31.5bTmG.0.0.Wl5UwJvy',
                        name: '千千衣莎',
                        sells:8800,
                        goodsCount: 99,
                        keyInfo:'卖家图如下：',
                        score: [{name:'描述相符',scores:4.64,isBetter:false},
                                    {name:'价格合理',scores:5,isBetter:true},
                                    {name:'质量满意',scores:4.62,isBetter:false}]
                    },
                    image1: ['https://s11.mogucdn.com/mlcdn/776a41/191106_2ej91iibg602c8fbc777hicj3ci3f_750x1000.jpg_468x468.jpg',
                    'https://s5.mogucdn.com/mlcdn/c45406/190829_5j56k32a27jijde52dl6238f269ji_640x960.jpg_468x468.jpg',
                    'https://s11.mogucdn.com/mlcdn/c45406/190829_69ej20id7ad6570j4ld550a3j8463_640x960.jpg_468x468.jpg',
                    'https://s5.mogucdn.com/mlcdn/c45406/190829_35c1dfh3ik0f63b38fk04533dgf3c_640x960.jpg_468x468.jpg',
                    'https://s5.mogucdn.com/mlcdn/c45406/190829_3h86ej1dih0172j8e5ei3bef48817_640x960.jpg_468x468.jpg'],
                    image2: ['https://s5.mogucdn.com/mlcdn/c45406/190829_6f178cbge9b13e89le93bal6e4c61_650x650.jpg_750x999.jpg',
                    'https://s5.mogucdn.com/mlcdn/c45406/190829_4dkf1048bgihc3g0bkd5ek0ij0918_650x650.jpg_750x999.jpg',
                    'https://s5.mogucdn.com/mlcdn/c45406/190829_1dek89g7c37gf94ck9ecb6aig3gfl_650x683.jpg_750x999.jpg',
                    'https://s5.mogucdn.com/mlcdn/c45406/190829_582bff54bib54g30c6ga162c9jjhf_650x650.jpg_750x999.jpg',
                    'https://s5.mogucdn.com/mlcdn/c45406/190829_6ke99cchc7a84j59k7e66ijajfe12_650x650.jpg_750x999.jpg',
                    'https://s5.mogucdn.com/mlcdn/c45406/190829_1adfgi8c411b6ih5fik190g0blhg6_650x650.jpg_750x999.jpg']
                }
            }
        },
        created() {
            this.id = this.$route.params.id
        },
        mounted() {
            // this.id = this.$route.params.id
        },
        activated() {
        }
    }
</script>

<style scoped>
  .detail {
      height: 100vh;
      position: relative;
      z-index: 9;
      background-color: #fff;
  }

  .content {
      position: absolute;
      top: 44px;
      bottom: 49px;
      overflow: hidden;
      left: 0;
      right: 0;
      background-color: #fff;

  }
</style>
