<template>
    <div class="home">
       <nav-bar class="nav-bar"><div slot="center">主页</div></nav-bar>
<!--        监听组件的原生事件要用.native-->
       <back-top @click.native="backToTop" v-show="isShow"></back-top>
        <scroll class="content" ref="scroll"
                :probe-type="3"
                @scrollBack="showBackTop"
                :pull-up-load="true"
                @pullingUp="loadMore">
            <home-swiper></home-swiper>
            <recommand-view></recommand-view>
            <tab-control :titles="Text" class="tab-control" @tabClick="changeGoods"></tab-control>
            <goods-list :goods="showGoods"></goods-list>
            <ul>
                <li>占位1</li>
                <li>占位2</li>
                <li>占位3</li>
                <li>占位4</li>
                <li>占位5</li>
                <li>占位6</li>
                <li>占位7</li>
                <li>占位8</li>
                <li>占位9</li>
                <li>占位10</li>
                <li>占位11</li>
                <li>占位12</li>
                <li>占位13</li>
                <li>占位14</li>
                <li>占位15</li>
                <li>占位16</li>
                <li>占位17</li>
                <li>占位18</li>
                <li>占位19</li>
                <li>占位20</li>
                <li>占位21</li>
                <li>占位22</li>
                <li>占位23</li>
                <li>占位24</li>
                <li>占位25</li>
                <li>占位26</li>
                <li>占位27</li>
                <li>占位28</li>
                <li>占位29</li>
                <li>占位30</li>
                <li>占位31</li>
                <li>占位32</li>
                <li>占位33</li>
                <li>占位34</li>
                <li>占位35</li>
                <li>占位36</li>
                <li>占位37</li>
                <li>占位38</li>
                <li>占位39</li>
                <li>占位40</li>
                <li>占位41</li>
                <li>占位42</li>
                <li>占位43</li>
                <li>占位44</li>
                <li>占位45</li>
                <li>占位46</li>
                <li>占位47</li>
                <li>占位48</li>
                <li>占位49</li>
                <li>占位50</li>
                <li>占位51</li>
                <li>占位52</li>
                <li>占位53</li>
                <li>占位54</li>
                <li>占位55</li>
                <li>占位56</li>
                <li>占位57</li>
                <li>占位58</li>
                <li>占位59</li>
                <li>占位60</li>
                <li>占位61</li>
                <li>占位62</li>
                <li>占位63</li>
                <li>占位64</li>
                <li>占位65</li>
                <li>占位66</li>
                <li>占位67</li>
                <li>占位68</li>
                <li>占位69</li>
                <li>占位70</li>
                <li>占位71</li>
                <li>占位72</li>
                <li>占位73</li>
                <li>占位74</li>
                <li>占位75</li>
                <li>占位76</li>
                <li>占位77</li>
                <li>占位78</li>
                <li>占位79</li>
                <li>占位80</li>
                <li>占位81</li>
                <li>占位82</li>
                <li>占位83</li>
                <li>占位84</li>
                <li>占位85</li>
                <li>占位86</li>
                <li>占位87</li>
                <li>占位88</li>
                <li>占位89</li>
                <li>占位90</li>
                <li>占位91</li>
                <li>占位92</li>
                <li>占位93</li>
                <li>占位94</li>
                <li>占位95</li>
                <li>占位96</li>
                <li>占位97</li>
                <li>占位98</li>
                <li>占位99</li>
                <li>占位100</li>
            </ul>
        </scroll>
    </div>
</template>

<script>

    import TabBar from "components/common/tabbar/TabBar";
    import NavBar from "components/common/navbar/NavBar";
    import TabBarItem from "components/common/tabbar/TabBarItem";
    import RecommandView from "./childComps/RecommandView";
    import HomeSwiper from "./childComps/HomeSwiper";
    import TabControl from "components/common/tabControl/TabControl";
    import GoodsList from "components/content/goods/GoodsList";
    import Scroll from "components/common/scroll/Scroll";
    import BackTop from "components/content/backTop/BackTop";

    export default {
        name: "Home",
        components: {GoodsList,TabControl, HomeSwiper, RecommandView, TabBarItem,NavBar, TabBar,Scroll,BackTop},
        data(){
            return {
                Text: ['流行','新款','精选'],
                goods: {
                    'pop': {page:0,list: [{img:'https://s5.mogucdn.com/mlcdn/776a41/191030_3g5fc5k3djc7f27eb6d30fa328kb1_750x1125.jpg_440x587.v1cAC.40.webp',message:'白色丝袜',price:66.7,collect:77},
                            {img:'https://s5.mogucdn.com/mlcdn/776a41/191104_08d4ih63dfl7h1ggglb077a2jih08_750x1125.jpg_440x587.v1cAC.40.webp',message:'白色裙子',price:128,collect:255},
                            {img:'https://s5.mogucdn.com/mlcdn/776a41/191030_635fch4eh1ei0ghce7d04gd29lgak_750x1125.jpg_440x587.v1cAC.40.webp',message:'黑色漂亮裙子',price:256,collect:376},
                            {img:'https://s5.mogucdn.com/mlcdn/776a41/191030_075hg9d288045ca35h4b23342c093_750x1125.jpg_440x587.v1cAC.40.webp',message:'赫本小黑裙',price:1128,collect:2525}]},
                    'news': {page:0,list:[
                            {img:'https://s5.mogucdn.com/mlcdn/c45406/191029_7be58ijgibilbli09dgcehg72124j_640x960.jpg_440x587.v1cAC.40.webp',message:'仙女韩范小白裙',price:109,collect:33},
                            {img:'https://s5.mogucdn.com/mlcdn/776a41/191104_1fjahe25aehc8e662i7bji8002abi_750x1125.jpg_440x587.v1cAC.40.webp',message: '秋季法式白裙',price:98,collect: 494},
                            {img:'https://s5.mogucdn.com/mlcdn/776a41/191104_373i6dd9belbjg59ebhce084ceh3h_750x1125.jpg_440x587.v1cAC.40.webp',message:'春秋螺纹灰色打底裤',price:28,collect:487},
                            {img:'https://s5.mogucdn.com/mlcdn/776a41/191104_3473i6lil32h11c7jd2if9b4fah0f_750x1125.jpg_440x587.v1cAC.40.webp',message:'黑色牛仔裤',price:98,collect:876},
                        ]},
                    'sell': {page:0,list:[
                            {img:'https://s5.mogucdn.com/mlcdn/776a41/191104_625l8c9fhd581ace37c675ealc728_750x1125.jpg_440x587.v1cAC.40.webp',message:'加绒牛仔裤',price:109,collect:33},
                            {img:'https://s5.mogucdn.com/mlcdn/776a41/191104_08bh2fba3c00e0hbl07j783g36ehf_750x1125.jpg_440x587.v1cAC.40.webp',message:'打底裤秋季女袜',price:109,collect:33},
                            {img:'https://s5.mogucdn.com/mlcdn/776a41/191104_8ef9e560hj4eb6310112c73h3j25j_750x1125.jpg_440x587.v1cAC.40.webp',message:'高腰牛仔裤',price:1069,collect:332},
                            {img:'https://s5.mogucdn.com/mlcdn/776a41/191104_14c818dbfe8675b78db8ghfk6lj12_750x1125.jpg_440x587.v1cAC.40.webp',message:'黑色宽松运动裤',price:169,collect:32},

                        ]},

                },
                currentType: 'pop',
                isShow: false

            }
        },
        computed: {
            showGoods(){
                return this.goods[this.currentType].list
            }
        },
        methods: {
          changeGoods(index){
             switch (index) {
                 case 0:
                     this.currentType = 'pop'
                     break
                 case 1:
                     this.currentType = 'news'
                     break
                 case 2:
                     this.currentType = 'sell'
                 break;
             }
          },
          backToTop(){
              // scrollTo回到某一个位置（x,y)
              // props是父组件传子组件 ref refs是子组件传父组件
              this.$refs.scroll.scroll.scrollTo(0,0,500)
          },
          showBackTop(position){
              this.isShow = (position.y < -1000)
          },
          loadMore(){
             this.goods[this.currentType].list.push(...this.goods['sell'].list)
          }
        },
        mounted() {

        },
        created() {

        }
    }
</script>

<style scoped>
   .home {
         height: 100vh;
         position: relative;

   }
   .nav-bar {
       background-color: #ff8198;
       font-weight: 700;
       color: #ffffff;
   }

   .content {
       position: absolute;
       top: 44px;
       bottom: 49px;
       overflow: hidden;
       left: 0;
       right: 0;

   }




</style>
