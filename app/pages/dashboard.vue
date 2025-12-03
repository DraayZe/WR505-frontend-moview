<template>
  <div class="min-h-screen bg-gray-50">
    <nav class="bg-white shadow-sm">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
          <h1 class="text-xl font-bold text-gray-800">Dashboard</h1>
          <div class="flex items-center gap-4">
            <span class="text-gray-600">{{ auth.user?.email }}</span>
            <button
              @click="auth.logout()"
              class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition"
            >
              Déconnexion
            </button>
          </div>
        </div>
      </div>
    </nav>

    <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <div v-if="loading" class="text-center py-12">
        <p class="text-gray-600">Chargement des données...</p>
      </div>

      <div v-else class="space-y-8">
        <!-- Films -->
        <section class="bg-white rounded-lg shadow p-6">
          <h2 class="text-2xl font-bold text-gray-800 mb-4">Films</h2>
          <div v-if="movies.length > 0" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            <div
              v-for="movie in movies"
              :key="movie.id"
              class="border border-gray-200 rounded-lg p-4 hover:shadow-md transition"
            >
              <h3 class="font-semibold text-lg">{{ movie.title }}</h3>
              <p class="text-sm text-gray-600">{{ movie.releaseDate }}</p>
            </div>
          </div>
          <p v-else class="text-gray-500">Aucun film disponible</p>
        </section>

        <!-- Acteurs -->
        <section class="bg-white rounded-lg shadow p-6">
          <h2 class="text-2xl font-bold text-gray-800 mb-4">Acteurs</h2>
          <div v-if="actors.length > 0" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            <div
              v-for="actor in actors"
              :key="actor.id"
              class="border border-gray-200 rounded-lg p-4 hover:shadow-md transition"
            >
              <p class="font-semibold">{{ actor.firstName }} {{ actor.lastName }}</p>
              <p class="text-sm text-gray-600">{{ actor.nationality }}</p>
            </div>
          </div>
          <p v-else class="text-gray-500">Aucun acteur disponible</p>
        </section>

        <!-- Réalisateurs -->
        <section class="bg-white rounded-lg shadow p-6">
          <h2 class="text-2xl font-bold text-gray-800 mb-4">Réalisateurs</h2>
          <div v-if="directors.length > 0" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            <div
              v-for="director in directors"
              :key="director.id"
              class="border border-gray-200 rounded-lg p-4 hover:shadow-md transition"
            >
              <p class="font-semibold">{{ director.firstName }} {{ director.lastName }}</p>
              <p class="text-sm text-gray-600">{{ director.nationality }}</p>
            </div>
          </div>
          <p v-else class="text-gray-500">Aucun réalisateur disponible</p>
        </section>

        <!-- Catégories -->
        <section class="bg-white rounded-lg shadow p-6">
          <h2 class="text-2xl font-bold text-gray-800 mb-4">Catégories</h2>
          <div v-if="categories.length > 0" class="flex flex-wrap gap-2">
            <span
              v-for="category in categories"
              :key="category.id"
              class="bg-blue-100 text-blue-800 px-3 py-1 rounded-full text-sm font-medium"
            >
              {{ category.name }}
            </span>
          </div>
          <p v-else class="text-gray-500">Aucune catégorie disponible</p>
        </section>

        <!-- Utilisateurs (si admin) -->
        <section class="bg-white rounded-lg shadow p-6">
          <h2 class="text-2xl font-bold text-gray-800 mb-4">Utilisateurs</h2>
          <div v-if="users.length > 0" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            <div
              v-for="user in users"
              :key="user.id"
              class="border border-gray-200 rounded-lg p-4 hover:shadow-md transition"
            >
              <p class="font-semibold">{{ user.email }}</p>
              <p class="text-sm text-gray-600">{{ user.name }}</p>
            </div>
          </div>
          <p v-else class="text-gray-500">Aucun utilisateur disponible</p>
        </section>
      </div>
    </main>
  </div>
</template>

<script setup lang="ts">
import { useAuthStore } from '~/stores/auth'

definePageMeta({
  middleware: 'auth',
})

const auth = useAuthStore()
const { fetchActors, fetchCategories, fetchDirectors, fetchMovies, fetchUsers } = useApiData()

const actors = ref<any[]>([])
const categories = ref<any[]>([])
const directors = ref<any[]>([])
const movies = ref<any[]>([])
const users = ref<any[]>([])
const loading = ref(true)

onMounted(async () => {
  try {
    const [actorsData, categoriesData, directorsData, moviesData, usersData] = await Promise.all([
      fetchActors(),
      fetchCategories(),
      fetchDirectors(),
      fetchMovies(),
      fetchUsers().catch(() => ({ 'hydra:member': [] })), // Peut échouer si pas admin
    ])

    actors.value = actorsData['hydra:member'] || []
    categories.value = categoriesData['hydra:member'] || []
    directors.value = directorsData['hydra:member'] || []
    movies.value = moviesData['hydra:member'] || []
    users.value = usersData['hydra:member'] || []
  } catch (error) {
    console.error('Erreur lors du chargement des données:', error)
  } finally {
    loading.value = false
  }
})
</script>
