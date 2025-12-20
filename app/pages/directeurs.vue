<script setup lang="ts">
const query = `
query {
  directors(first: 500) {
    totalCount
    edges {
      node {
        id
        firstname
        lastname
        dob
        dod
      }
    }
  }
}
`

type DirectorsQuery = {
  directors: {
    totalCount: number
    edges: {
      node: {
        id: string
        firstname: string
        lastname: string
        dob: string
        dod: string | null
      }
    }[]
  }
}

const { data } = await useAsyncGqlPulse<DirectorsQuery>({
  client: 'backendapi',
  document: query,
})

const searchQuery = ref('')
const filteredDirectors = computed(() => {
  if (!data.value?.directors?.edges) return []
  let directors = data.value.directors.edges

  if (searchQuery.value.trim()) {
    const q = searchQuery.value.toLowerCase()
    directors = directors.filter(director =>
        director.node.firstname.toLowerCase().includes(q) ||
        director.node.lastname.toLowerCase().includes(q)
    )
  }

  return directors
})

const filteredDirectorsCount = computed(() => filteredDirectors.value.length)
</script>

<template>
  <div class="min-h-screen bg-[#13151d]">

    <!-- Section Header -->
    <section class="bg-gradient-to-br from-[#1b1e29] via-[#252837] to-[#1b1e29] border-b border-[#292d3e]">
      <div class="container mx-auto px-6 lg:px-12 py-40">
        <div class="max-w-3xl">
          <h1 class="text-5xl text-white font-display mb-4">
            Réalisateurs
          </h1>
          <p class="text-gray-400 text-lg font-body mb-2">
            Découvrez les talents qui façonnent le 7ᵉ art.
          </p>
          <p class="text-gray-500 font-body">
            {{ filteredDirectorsCount }} réalisateur{{ filteredDirectorsCount > 1 ? 's' : '' }} disponible{{ filteredDirectorsCount > 1 ? 's' : '' }}
          </p>
        </div>
      </div>
    </section>

    <!-- Section Filters -->
    <section class="border-b border-[#292d3e]">
      <div class="container mx-auto px-6 lg:px-12 py-8 flex flex-col lg:flex-row gap-6 lg:items-center lg:justify-between">
        <div class="relative w-full lg:w-[400px]">
          <input
              v-model="searchQuery"
              type="text"
              placeholder="Rechercher un réalisateur..."
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

        <div v-if="filteredDirectors.length" class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
          <div
              v-for="director in filteredDirectors"
              :key="director.node.id"
              class="relative group rounded-xl overflow-hidden bg-[#1b1e29] border border-[#292d3e] hover:border-[#f43a00] transition"
          >
            <!-- Image -->
            <div class="relative h-72">
              <img
                  src="/images/christopher-nolan.jpg"
                  alt="Photo de l'acteur"
                  class="w-full h-full object-cover"
              />
              <div class="absolute inset-0 bg-gradient-to-t from-black via-transparent"></div>
            </div>

            <!-- Texte sur le dégradé (visible au survol) -->
            <div class="absolute bottom-4 left-4 right-4 text-white opacity-0 group-hover:opacity-100 transition-opacity">
              <h3 class="font-semibold text-lg text-[#f43a00]">
                {{ director.node.firstname }} {{ director.node.lastname }}
              </h3>
            </div>
          </div>
        </div>

        <div v-else class="text-center py-24 text-gray-500">
          Aucun réalisateur ne correspond à votre recherche.
        </div>

      </div>
    </section>

  </div>
</template>
