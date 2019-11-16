import axios from 'axios'

export function getDetailKind(kind) {
    return axios({
        method: 'post',
        url: '/queryByKind',
        params: {
            kind
        }
    })
}
