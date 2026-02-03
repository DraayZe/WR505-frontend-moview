<script setup lang="ts">
import { Search, Filter, Film, Grid3X3, List } from 'lucide-vue-next'

const query = `
query {
  movies(first: 500) {
    totalCount
    edges {
      node {
        id
        name
        description
        categories {
          edges {
            node {
              id
              name
            }
          }
        }
      }
    }
  }
}
`

type MoviesQuery = {
  movies: {
    totalCount: number
    edges: {
      node: {
        id: string
        name: string
        description: string
        categories: {
          edges: {
            node: {
              id: string
              name: string
            }
          }[]
        }
      }
    }[]
  }
}

const { data } = await useAsyncGqlPulse<MoviesQuery>({
  client: 'backendapi',
  document: query,
})

const selectedCategory = ref<string | null>(null)
const searchQuery = ref('')
const viewMode = ref<'grid' | 'list'>('grid')

const getIdFromIri = (iri: string) => iri.split('/').pop()!

const allCategories = computed(() => {
  if (!data.value?.movies?.edges) return []
  const map = new Map<string, { id: string; name: string }>()
  data.value.movies.edges.forEach(movie => {
    movie.node.categories.edges.forEach(cat => {
      const id = getIdFromIri(cat.node.id)
      map.set(id, { id, name: cat.node.name })
    })
  })
  return Array.from(map.values())
})

const filteredMovies = computed(() => {
  if (!data.value?.movies?.edges) return []
  let movies = data.value.movies.edges

  if (selectedCategory.value) {
    movies = movies.filter(movie =>
      movie.node.categories.edges.some(
        cat => getIdFromIri(cat.node.id) === selectedCategory.value
      )
    )
  }

  if (searchQuery.value.trim()) {
    const q = searchQuery.value.toLowerCase()
    movies = movies.filter(movie =>
      movie.node.name.toLowerCase().includes(q)
    )
  }

  return movies
})

const filteredMoviesCount = computed(() => filteredMovies.value.length)

import {
  Select,
  SelectContent,
  SelectGroup,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
</script>

<template>
  <div class="min-h-screen bg-[#0a0a0c]">
    <section class="relative pt-32 pb-20 overflow-hidden">
      <div class="absolute inset-0">
        <div class="absolute top-0 left-1/4 w-96 h-96 bg-[#d4af37]/5 rounded-full blur-3xl"></div>
        <div class="absolute bottom-0 right-1/4 w-80 h-80 bg-[#d4af37]/3 rounded-full blur-3xl"></div>
      </div>

      <div class="absolute left-8 top-0 bottom-0 w-px bg-gradient-to-b from-transparent via-[#d4af37]/20 to-transparent"></div>
      <div class="absolute right-8 top-0 bottom-0 w-px bg-gradient-to-b from-transparent via-[#d4af37]/20 to-transparent"></div>

      <div class="relative z-10 container mx-auto px-6 lg:px-12">
        <div class="max-w-3xl">
          <div class="flex items-center gap-4 mb-6">
            <Film class="w-5 h-5 text-[#d4af37]" />
            <span class="text-[#d4af37] text-sm tracking-[0.3em] uppercase font-body">Collection</span>
          </div>

          <h1 class="font-display text-5xl lg:text-6xl text-white mb-6">
            Catalogue de <span class="italic text-gold-gradient">films</span>
          </h1>

          <p class="font-body text-[#c0c0c0] text-lg mb-4">
            Explorez notre collection complète de films, des classiques intemporels aux dernières sorties.
          </p>

          <p class="font-body text-[#d4af37]">
            {{ filteredMoviesCount }} film{{ filteredMoviesCount > 1 ? 's' : '' }} disponible{{ filteredMoviesCount > 1 ? 's' : '' }}
          </p>
        </div>
      </div>
    </section>

    <section class="border-y border-[#d4af37]/10 bg-[#0a0a0c]/80 backdrop-blur-sm sticky top-[72px] z-40">
      <div class="container mx-auto px-6 lg:px-12 py-6">
        <div class="flex flex-col lg:flex-row gap-6 lg:items-center lg:justify-between">
          <div class="flex flex-col sm:flex-row gap-4">
            <Select v-model="selectedCategory">
              <SelectTrigger class="w-full sm:w-[240px] bg-[#12121a] border border-[#d4af37]/20 text-white hover:border-[#d4af37] transition-colors duration-300 cursor-pointer font-body">
                <div class="flex items-center gap-2">
                  <Filter class="w-4 h-4 text-[#d4af37]" />
                  <SelectValue placeholder="Toutes les catégories" />
                </div>
              </SelectTrigger>
              <SelectContent class="bg-[#12121a] border border-[#d4af37]/20">
                <SelectGroup>
                  <SelectItem :value="null" class="text-white hover:bg-[#d4af37]/10 cursor-pointer font-body">
                    Toutes les catégories
                  </SelectItem>
                  <SelectItem
                    v-for="cat in allCategories"
                    :key="cat.id"
                    :value="cat.id"
                    class="text-white hover:bg-[#d4af37]/10 cursor-pointer font-body"
                  >
                    {{ cat.name }}
                  </SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>

            <div class="relative w-full sm:w-[300px]">
              <Search class="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-[#d4af37]/50" />
              <input
                v-model="searchQuery"
                type="text"
                placeholder="Rechercher un film..."
                class="w-full pl-12 pr-4 py-3 bg-[#12121a] border border-[#d4af37]/20 text-white placeholder-[#c0c0c0]/40 font-body focus:outline-none focus:border-[#d4af37] transition-colors duration-300"
              />
            </div>
          </div>

          <div class="flex items-center gap-2">
            <button
              @click="viewMode = 'grid'"
              :class="[
                'p-3 border transition-all duration-300 hover:cursor-pointer',
                viewMode === 'grid'
                  ? 'bg-[#d4af37]/10 border-[#d4af37] text-[#d4af37]'
                  : 'bg-transparent border-[#d4af37]/20 text-[#c0c0c0] hover:border-[#d4af37]/40'
              ]"
            >
              <Grid3X3 class="w-4 h-4" />
            </button>
            <button
              @click="viewMode = 'list'"
              :class="[
                'p-3 border transition-all duration-300 hover:cursor-pointer',
                viewMode === 'list'
                  ? 'bg-[#d4af37]/10 border-[#d4af37] text-[#d4af37]'
                  : 'bg-transparent border-[#d4af37]/20 text-[#c0c0c0] hover:border-[#d4af37]/40'
              ]"
            >
              <List class="w-4 h-4" />
            </button>
          </div>
        </div>
      </div>
    </section>

    <section class="py-16">
      <div class="container mx-auto px-6 lg:px-12">
        <div v-if="filteredMovies.length && viewMode === 'grid'" class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-6">
          <NuxtLink
            v-for="(movie, index) in filteredMovies"
            :key="movie.node.id"
            :to="`/movies/${getIdFromIri(movie.node.id)}`"
            class="group relative aspect-[2/3] overflow-hidden bg-[#12121a]"
          >
            <div class="absolute inset-0">
              <img
                src="/images/oblivion.jpg"
                :alt="movie.node.name"
                class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
              />
            </div>
            <div class="absolute inset-0 bg-gradient-to-t from-[#0a0a0c] via-[#0a0a0c]/20 to-transparent opacity-60 group-hover:opacity-90 transition-opacity duration-300"></div>
            <div class="absolute inset-0 border border-[#d4af37]/0 group-hover:border-[#d4af37]/40 transition-all duration-300"></div>
            <div class="absolute inset-0 flex flex-col justify-end p-5">
              <div class="flex flex-wrap gap-2 mb-3 opacity-0 group-hover:opacity-100 transition-opacity duration-300 transform translate-y-2 group-hover:translate-y-0">
                <span
                  v-for="cat in movie.node.categories.edges.slice(0, 2)"
                  :key="cat.node.id"
                  class="text-xs font-body px-2 py-1 bg-[#d4af37]/20 text-[#d4af37]"
                >
                  {{ cat.node.name }}
                </span>
              </div>
              <h3 class="font-display text-xl text-white group-hover:text-[#f4e4a6] transition-colors duration-300 line-clamp-2">
                {{ movie.node.name }}
              </h3>

              <div class="mt-3 h-px w-0 bg-gradient-to-r from-[#d4af37] to-transparent group-hover:w-full transition-all duration-500"></div>
            </div>

            <div class="absolute top-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
              <div class="w-8 h-8 bg-[#d4af37] flex items-center justify-center">
                <span class="font-display font-bold text-[#0a0a0c] text-sm">{{ index + 1 }}</span>
              </div>
            </div>
          </NuxtLink>
        </div>

        <div v-else-if="filteredMovies.length && viewMode === 'list'" class="space-y-4">
          <NuxtLink
            v-for="(movie, index) in filteredMovies"
            :key="movie.node.id"
            :to="`/movies/${getIdFromIri(movie.node.id)}`"
            class="group flex gap-6 p-4 bg-[#12121a] border border-[#d4af37]/10 hover:border-[#d4af37]/30 transition-all duration-300"
          >
            <div class="w-24 h-36 shrink-0 overflow-hidden">
              <img
                src="/images/oblivion.jpg"
                :alt="movie.node.name"
                class="w-full h-full object-cover transition-transform duration-300 group-hover:scale-105"
              />
            </div>

            <div class="flex-1 flex flex-col justify-center">
              <div class="flex items-center gap-4 mb-2">
                <span class="text-[#d4af37] font-display text-lg">{{ String(index + 1).padStart(2, '0') }}</span>
                <h3 class="font-display text-xl text-white group-hover:text-[#f4e4a6] transition-colors duration-300">
                  {{ movie.node.name }}
                </h3>
              </div>

              <p class="font-body text-[#c0c0c0] text-sm line-clamp-2 mb-3">
                {{ movie.node.description || 'Aucune description disponible.' }}
              </p>

              <div class="flex flex-wrap gap-2">
                <span
                  v-for="cat in movie.node.categories.edges"
                  :key="cat.node.id"
                  class="text-xs font-body px-2 py-1 bg-[#d4af37]/10 text-[#d4af37] border border-[#d4af37]/20"
                >
                  {{ cat.node.name }}
                </span>
              </div>
            </div>

            <div class="flex items-center">
              <div class="w-10 h-10 border border-[#d4af37]/20 flex items-center justify-center group-hover:bg-[#d4af37] group-hover:border-[#d4af37] transition-all duration-300">
                <svg class="w-5 h-5 text-[#d4af37] group-hover:text-[#0a0a0c] transition-colors duration-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                </svg>
              </div>
            </div>
          </NuxtLink>
        </div>

        <div v-else class="text-center py-24">
          <Film class="w-16 h-16 text-[#d4af37]/20 mx-auto mb-6" />
          <h3 class="font-display text-2xl text-white mb-2">Aucun film trouvé</h3>
          <p class="font-body text-[#c0c0c0]">Aucun film ne correspond à votre recherche.</p>
        </div>
      </div>
    </section>
  </div>
</template>

<style scoped>
.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>
