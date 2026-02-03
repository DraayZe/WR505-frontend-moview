import tailwindcss from "@tailwindcss/vite";

export default defineNuxtConfig({
  compatibilityDate: "2025-07-15",
  devtools: { enabled: true },
  css: ['./app/assets/css/main.css'],
  vite: {
    plugins: [
      tailwindcss(),
    ],
  },
  runtimeConfig: {
    public: {
      apiBase: 'http://localhost:8319'
    }
  },
  modules: ['nuxt-gql-pulse'],

  gqlPulse: {
    clients: {
      backendapi: {
        endpoint: 'http://localhost:8319/api/graphql',
      },
    },
  },
});