import axios from 'axios'

export function getCartList(userID) {
    return axios({
        method:'post',
        url:'queryCartByUserID',
        params: {
            userID
        }
    })
}

export function toCalculate(userID,goodsID) {
    return axios({
        method: 'post',
        url: '/toCalculate',
        params: {
            userID,
            goodsID
        }
    })
}

export function getCart(userID) {
    return axios({
        method: 'post',
        url: '/getCart',
        params: {
            userID
        }
    })
}
