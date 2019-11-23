import axios from  'axios'


export function getBalance(userID) {
   return axios({
       method: 'post',
       url: '/getBalance',
       params: {
           userID
       }
   })
}
