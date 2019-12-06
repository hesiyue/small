module.exports = {
    configureWebpack:{
        resolve: {
            alias: {
                'components': '@/components',
                'content': 'components/content',
                'common': 'components/common',
                'assets': '@/assets',
                'network': '@/network',
                'views': '@/views',
            }
        }
    },
    devServer: {
        // host与port此处可以不设置
        host: '192.168.1.102',
        port : '8081',
        proxy: {
            // /api将前面的baseUrl替换成当前的target中的地址
            '/api': {
                target: 'http://localhost:8080/api',
                ws: true,
                changeOrigin:  true,
                pathRewrite: {
                    '^/api' : ''
                }
            }
        }
    }

}
