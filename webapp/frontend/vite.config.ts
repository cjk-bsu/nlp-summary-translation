import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'


export default defineConfig({
  plugins: [vue()],
  server: {
    proxy: {
      '/api': {
        target: 'https://urban-couscous-j6gx7rg6rqqcq7w9-3000.app.github.dev',
        changeOrigin: true,
        secure: true,
      },
    },
  }
})