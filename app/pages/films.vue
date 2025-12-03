<script setup lang="ts">
const { isAuthenticated, initAuth } = useAuth()
const { getMovies } = useMovies()
const router = useRouter()

onMounted(() => {
  initAuth()
  loadProtectedData()
})

watchEffect(() => {
  if (!isAuthenticated.value && import.meta.client) {
    router.push('/login')
  }
})

const data = ref<any>(null)
const loading = ref(false)
const error = ref<string | null>(null)

const loadProtectedData = async () => {
  loading.value = true
  error.value = null

  const result = await getMovies()

  if (result.success) {
    data.value = result.data
  } else {
    error.value = result.error
  }

  loading.value = false
}

const getMoviesList = (responseData: any) => {
  if (!responseData) return []
  if (responseData.member) return responseData.member
  if (responseData['hydra:member']) return responseData['hydra:member']
  if (Array.isArray(responseData)) return responseData
  return []
}
</script>

<template>
  <div class="min-h-screen py-8 px-4 sm:px-6 lg:px-8">
    <div class="max-w-7xl mx-auto">
      <div class="mb-8">
        <h1 class="text-4xl font-bold text-[#262620] mb-2">Films</h1>
        <p class="text-[#899878]">
          {{ data?.totalItems || data?.['hydra:totalItems'] || '...' }} films disponibles
        </p>
      </div>

      <div v-if="error" class="mb-6 p-4 bg-red-100 border border-red-300 rounded text-red-700">
        {{ error }}
      </div>

      <div v-if="loading && !data" class="text-center py-20">
        <p class="text-[#899878]">Chargement...</p>
      </div>

      <div v-if="data && getMoviesList(data).length > 0" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
        <div
            v-for="(item, index) in getMoviesList(data)"
            :key="item['@id'] || item.id || index"
            class="bg-white border border-[#899878]/20 rounded-lg overflow-hidden hover:border-[#899878] transition-colors"
        >
          <div class="h-48 bg-[#899878]/10 flex items-center justify-center">
            <span class="text-[#899878]/40 text-4xl font-bold">
              {{ (item.name || item.title || '?')[0].toUpperCase() }}
            </span>
          </div>

          <div class="p-4">
            <h3 class="text-lg font-semibold text-[#262620] mb-2 line-clamp-1">
              {{ item.name || item.title || 'Sans titre' }}
            </h3>

            <p v-if="item.description" class="text-sm text-[#899878] mb-3 line-clamp-2">
              {{ item.description }}
            </p>

            <div class="flex items-center gap-4 text-sm text-[#899878]">
              <span v-if="item.duration">{{ item.duration }} min</span>
              <span v-if="item.releaseDate">{{ new Date(item.releaseDate).getFullYear() }}</span>
              <span v-if="item.rating" class="font-semibold">★ {{ item.rating }}/10</span>
            </div>
          </div>
        </div>
      </div>

      <div v-if="!loading && data && getMoviesList(data).length === 0" class="text-center py-20">
        <p class="text-[#899878]">Aucun film disponible</p>
      </div>
    </div>
  </div>
</template>
