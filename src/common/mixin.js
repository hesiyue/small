import {debounce} from "./utils";
import BackTop from "components/content/backTop/BackTop";

export const itemListenerMixin = {
    mounted(){
        const refresh = debounce(this.$refs.scroll.refresh,100)
        this.itemImgListener = ()=>{
            refresh()}
        this.$bus.$on('itemImgLoad',this.itemImgListener)

    }
}

export const backTopMixin = {
    components:{
      BackTop
    },
    data(){
        return {
            isShow: false
        }
    },
    methods:{
        backToTop(){
            // scrollTo回到某一个位置（x,y)
            // props是父组件传子组件 ref refs是子组件传父组件
            this.$refs.scroll.scroll && this.$refs.scroll.scroll.scrollTo(0,0,500)
        }
    }
}
