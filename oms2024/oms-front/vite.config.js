import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import path from 'path'
// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],
  resolve: {
    // 使用"@"表示项目的src目录
    alias: {
      '@': path.resolve(__dirname, './src'),
      /* 'excel': path.resolve(__dirname, '@/common/excel') */
    }
  },
  // vite 开发服务器配置
  server: {
    host: 'localhost', // 主机名
    port: 3000, // 端口
    open: true, // 启动项目时是自动打开浏览器
    strictPort: false, // 如果port指定端口被占用，是否仍然使用此端口（而不自动使用其它可用端口）
    https: false,// 是否使用https访问
    //服务端代理设置
    proxy: {
      //如果访问地址以"/api"开头,则自动代理到变量VITE_WAREHOUSE_CONTEXT_PATH所表示的
      //服务端地址http://localhost:9999/warehouse
      '/api': {
        target: 'http://localhost:9999/oms',
        changeOrigin: true,
        rewrite: path => path.replace(/^\/api/, '')
      }
    }
  },
})
