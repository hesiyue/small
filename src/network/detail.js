import axios from 'axios'


export function updateCartGoodsNum(userID,goodsID,num) {
   return axios({
       method:'post',
       url: '/updateCartGoodsNum',
       params: {
           userID,
           goodsID,
           num
       }
   })
}

