<script setup lang="ts">
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
  <div class="min-h-screen bg-[#13151d]">

    <section class="bg-gradient-to-br from-[#1b1e29] via-[#252837] to-[#1b1e29] border-b border-[#292d3e]">
      <div class="container mx-auto px-6 lg:px-12 py-40">
        <div class="max-w-3xl">
          <h1 class="text-5xl text-white font-display mb-4">
            Catalogue de films
          </h1>
          <p class="text-gray-400 text-lg font-body mb-2">
            Explorez notre collection complète de films.
          </p>
          <p class="text-gray-500 font-body">
            {{ filteredMoviesCount }} film{{ filteredMoviesCount > 1 ? 's' : '' }} disponible{{ filteredMoviesCount > 1 ? 's' : '' }}
          </p>
        </div>
      </div>
    </section>

    <section class="border-b border-[#292d3e]">
      <div class="container mx-auto px-6 lg:px-12 py-8 flex flex-col lg:flex-row gap-6 lg:items-center lg:justify-between">
        <Select v-model="selectedCategory">
          <SelectTrigger class="w-full lg:w-[260px] bg-[#1b1e29] border border-[#292d3e] text-white hover:cursor-pointer hover:border-[#f43a00]">
            <SelectValue placeholder="Toutes les catégories" />
          </SelectTrigger>
          <SelectContent class="bg-[#1b1e29] border-[#292d3e]">
            <SelectGroup>
              <SelectItem :value="null" class="text-white hover:cursor-pointer hover:bg-[#13151d]">
                Toutes les catégories
              </SelectItem>
              <SelectItem
                  v-for="cat in allCategories"
                  :key="cat.id"
                  :value="cat.id"
                  class="text-white hover:cursor-pointer hover:bg-[#13151d]"
              >
                {{ cat.name }}
              </SelectItem>
            </SelectGroup>
          </SelectContent>
        </Select>

        <div class="relative w-full lg:w-[400px]">
          <input
              v-model="searchQuery"
              type="text"
              placeholder="Rechercher un film..."
              class="w-full px-4 py-3 pl-10 bg-[#1b1e29] border border-[#292d3e] rounded-lg text-white placeholder-gray-500 focus:outline-none hover:border-[#f43a00] focus:border-[#f43a00]"
          />
          <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-5 w-5 text-gray-500 absolute left-3 top-1/2 -translate-y-1/2"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
          >
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
          </svg>
        </div>
      </div>
    </section>

    <section>
      <div class="container mx-auto px-6 lg:px-12 py-16">

        <div v-if="filteredMovies.length" class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
          <NuxtLink
              v-for="movie in filteredMovies"
              :key="movie.node.id"
              :to="`/movies/${getIdFromIri(movie.node.id)}`"
              class="relative group rounded-xl overflow-hidden"
          >
            <div class="relative w-full h-76">
              <img
                  src="/images/oblivion.jpg"
                  alt="Poster du film"
                  class="w-full h-full object-cover"
              />
              <div class="absolute inset-0 bg-gradient-to-t from-black via-transparent"></div>
            </div>

            <div class="absolute bottom-4 left-4 right-4 text-white opacity-0 group-hover:opacity-100 transition-opacity">
              <h3 class="font-semibold text-lg text-[#f43a00]">
                {{ movie.node.name }}
              </h3>
            </div>
          </NuxtLink>
        </div>

        <div v-else class="text-center py-24 text-gray-500">
          Aucun film ne correspond à votre recherche.
        </div>

      </div>
    </section>

  </div>
</template>

