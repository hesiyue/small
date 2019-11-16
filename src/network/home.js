import axios from 'axios'

export function getHomeMultiData() {
    return axios({
        method:'get',
        url: '/queryGoodsAll'
    })
}

export function getHomeData(type) {
    return axios({
       method: 'post',
       url: '/queryGoodsByWays',
       params: {
           type
       }
    })
}

export function getGoodsImg(imgid) {
    return axios({
        method:'post',
        url:'/queryGoodsImgs',
        params: {
            imgid
        }
    })
}

export function getGoodsDetail(id) {
    return axios({
        method: 'post',
        url: '/queryGoodsDetail',
        params: {
            id
        }
    })

}
