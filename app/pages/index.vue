<script setup lang="ts">
const query = `
query {
  movies {
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

  data.value.movies.edges.forEach(film => {
    film.node.categories.edges.forEach(cat => {
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
    movies = movies.filter(film =>
      film.node.categories.edges.some(
        cat => getIdFromIri(cat.node.id) === selectedCategory.value
      )
    )
  }

  if (searchQuery.value.trim()) {
    const query = searchQuery.value.toLowerCase().trim()
    movies = movies.filter(film =>
      film.node.name.toLowerCase().includes(query)
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
  SelectLabel,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
</script>

<template>
  <div class="relative min-h-screen flex">

    <main class="flex-1 p-8 space-y-10 relative z-10">
      <div class="flex">
        <div class="flex flex-col w-2/3">
          <h1 class="text-4xl font-bold text-gray-900 mb-2">
            Catalogue des films
          </h1>
          <p class="text-black/50">
            Découvrez notre sélection de films disponibles.
          </p>
          <p class="text-black/50 mt-1">
            {{ filteredMoviesCount }} film{{ filteredMoviesCount > 1 ? 's' : '' }} disponible{{ filteredMoviesCount > 1 ? 's' : '' }}
          </p>
        </div>
      <section>
        <Select v-model="selectedCategory">
          <SelectTrigger class="w-[250px] hover:cursor-pointer ">
            <SelectValue placeholder="Toutes les catégories" class="text-black"/>
          </SelectTrigger>
          <SelectContent>
            <SelectGroup>
              <SelectLabel>Catégories</SelectLabel>
              <SelectItem :value="null" class="hover:cursor-pointer">
                Toutes les catégories
              </SelectItem>
              <SelectItem v-for="cat in allCategories" :key="cat.id" :value="cat.id" class="hover:cursor-pointer">
                {{ cat.name }}
              </SelectItem>
            </SelectGroup>
          </SelectContent>
        </Select>
      </section>  </div>

      <section>
        <div class="relative">
          <input v-model="searchQuery" type="text" placeholder="Rechercher un film..." class="w-full px-4 py-3 pl-10 bg-white border border-gray-300 rounded-lg text-gray-900 placeholder-gray-400 focus:outline-none focus:border-emerald-500 focus:ring-1 focus:ring-emerald-200 transition-all"/>
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400 absolute left-3 top-1/2 -translate-y-1/2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
          </svg>
        </div>
      </section>

      <section>
        <h3 class="text-2xl font-bold mb-6 text-gray-900">
          Catalogue
        </h3>
        <div v-if="filteredMovies.length" class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-6">
          <NuxtLink v-for="film in filteredMovies" :key="film.node.id" :to="`/movies/${getIdFromIri(film.node.id)}`" class="bg-white/80 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 hover:cursor-pointer block">
            <div class="h-40 bg-white rounded-t-xl flex items-center justify-center border-b border-black/50">
            </div>

            <div class="p-4">
              <p class="font-semibold text-gray-900 mb-2">
                {{ film.node.name }}
              </p>

              <p class="text-xs text-gray-600 line-clamp-2">
                {{ film.node.description || 'Aucune description' }}
              </p>
            </div>
          </NuxtLink>
        </div>

        <div v-else class="text-center py-20 text-gray-500">
          Aucun film disponible
        </div>
      </section>

    </main>
  </div>
</template>
