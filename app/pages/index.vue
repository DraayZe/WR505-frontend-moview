<script setup lang="ts">
const { isAuthenticated, user, initAuth } = useAuth()

onMounted(() => {
  initAuth()
})
</script>

<template>
  <div class="min-h-screen py-16 px-4 sm:px-6 lg:px-8">
    <div class="max-w-4xl mx-auto">
      <div class="text-center mb-16">
        <h1 class="text-5xl font-bold text-[#262620] mb-4">
          MovieDB
        </h1>
        <p class="text-xl text-[#899878]">
          Votre collection de films
        </p>
      </div>

      <div class="bg-white border border-[#899878]/20 rounded-lg p-8 mb-12">
        <div v-if="isAuthenticated">
          <p class="text-[#262620] mb-6">
            Connecté en tant que <strong>{{ user?.email }}</strong>
          </p>
          <NuxtLink
            to="/films"
            class="w-full sm:w-auto px-8 py-3 bg-[#899878] text-white hover:cursor-pointer font-medium rounded hover:bg-[#899878]/80 text-center"
          >
            Voir les films
          </NuxtLink>
        </div>

        <div v-else class="text-center">
          <p class="text-[#262620] mb-6">
            Connectez-vous pour accéder à votre collection
          </p>
          <NuxtLink
            to="/login"
            class="inline-block px-8 py-3 bg-[#899878] text-[#e4e6c3] font-medium rounded hover:bg-[#899878]/80 transition-colors"
          >
            Se connecter
          </NuxtLink>
        </div>
      </div>

      <div class="grid md:grid-cols-3 gap-6">
        <div class="bg-white border border-[#899878]/20 rounded-lg p-6">
          <h3 class="text-[#262620] font-semibold mb-2">199 films</h3>
          <p class="text-[#899878] text-sm">Collection complète</p>
        </div>

        <div class="bg-white border border-[#899878]/20 rounded-lg p-6">
          <h3 class="text-[#262620] font-semibold mb-2">Sécurisé</h3>
          <p class="text-[#899878] text-sm">Authentification JWT</p>
        </div>

        <div class="bg-white border border-[#899878]/20 rounded-lg p-6">
          <h3 class="text-[#262620] font-semibold mb-2">API Platform</h3>
          <p class="text-[#899878] text-sm">Backend Symfony</p>
        </div>
      </div>
    </div>
  </div>
</template>
