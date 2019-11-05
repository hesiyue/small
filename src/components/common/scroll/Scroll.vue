<template>
   <div class="wrapper" ref="wrapper">
       <div class="content">
           <slot></slot>
       </div>
   </div>
</template>

<script>
    import BScroll from 'better-scroll'
    export default {
        name: "Scroll",
        props: {
            probeType: {
                type: Number,
                default: 0
            },
            pullUpLoad: {
               type: Boolean,
                default: false
            }
        },
        data(){
            return {
                scroll: null
            }
        },
        mounted() {
            this.scroll = new BScroll(this.$refs.wrapper,{
                click: true,
                probeType: this.probeType,
                pullUpLoad: this.pullUpLoad
            })
            this.scroll.on('scroll',position=>{
                this.$emit('scrollBack',position)
            })
            this.scroll.on('pullingUp',()=>{
                this.$emit('pullingUp')
                // 操作完成后必须要setTimeout里面finishPullUp,否则只会刷新一次
                setTimeout(()=>{
                    this.scroll.finishPullUp()
                },1000)
                 this.scroll.refresh()

            })
        }
    }
</script>
<!--       ref绑定在一个组件上，那么获得是是组件对象，如果绑定在一个元素上，那么获得的是一个元素对象-->
<style scoped>

</style>
