<template>
  <div class="flex items-center justify-center min-h-screen bg-gradient-to-br from-blue-500 to-purple-600">
    <div class="text-center text-white p-8">
      <h1 class="text-5xl font-bold mb-4">Bienvenue sur Movie DB</h1>
      <p class="text-xl mb-8">Gérez votre collection de films, acteurs et réalisateurs</p>
      <div class="space-x-4">
        <NuxtLink
          to="/login"
          class="inline-block bg-white text-blue-600 px-6 py-3 rounded-lg font-semibold hover:bg-gray-100 transition"
        >
          Se connecter
        </NuxtLink>
        <NuxtLink
          to="/dashboard"
          class="inline-block bg-transparent border-2 border-white text-white px-6 py-3 rounded-lg font-semibold hover:bg-white hover:text-blue-600 transition"
        >
          Voir le Dashboard
        </NuxtLink>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
definePageMeta({
  layout: false,
})
</script>
