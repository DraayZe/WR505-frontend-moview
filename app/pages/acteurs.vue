<script setup lang="ts">
const query = `
query{
  actors(first: 500) {
    totalCount
    edges{
      node{
        id
        firstname
        lastname
        dob
        photo{
          id
        }
      }
    }
  }
}
`

type ActorsQuery = {
  actors: {
    totalCount: number
    edges: {
      node: {
        id: string
        firstname: string
        lastname: string
        dob: string
        photo: {
          id: string
        }
      }
    }[]
  }
}

const { data } = await useAsyncGqlPulse<ActorsQuery>({
  client: 'backendapi',
  document: query,
})

const selectedDecade = ref<string | null>(null)
const searchQuery = ref('')

const decades = computed(() => {
  const result = []
  for (let year = 1920; year < 2030; year += 10) {
    result.push({
      id: `${year}-${year + 10}`,
      label: `${year} - ${year + 10}`,
    })
  }
  return result
})

const getDecade = (dob: string) => {
  if (!dob) return null
  const year = new Date(dob).getFullYear()
  const decadeStart = Math.floor(year / 10) * 10
  return `${decadeStart}-${decadeStart + 10}`
}

const filteredActors = computed(() => {
  if (!data.value?.actors?.edges) return []

  let actors = data.value.actors.edges

  if (selectedDecade.value) {
    actors = actors.filter(
        actor => getDecade(actor.node.dob) === selectedDecade.value
    )
  }

  if (searchQuery.value.trim()) {
    const q = searchQuery.value.toLowerCase().trim()
    actors = actors.filter(actor =>
        actor.node.firstname.toLowerCase().includes(q) ||
        actor.node.lastname.toLowerCase().includes(q)
    )
  }

  return actors
})

const filteredActorsCount = computed(() => filteredActors.value.length)

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

    <!-- Section Header -->
    <section class="bg-gradient-to-br from-[#1b1e29] via-[#252837] to-[#1b1e29] border-b border-[#292d3e]">
      <div class="container mx-auto px-6 lg:px-12 py-40">
        <div class="max-w-3xl">
          <h1 class="text-5xl text-white font-display mb-4">
            Catalogue d'acteurs
          </h1>
          <p class="text-gray-400 text-lg font-body mb-2">
            Découvrez les visages qui font vivre le cinéma.
          </p>
          <p class="text-gray-500 font-body">
            {{ filteredActorsCount }} acteur{{ filteredActorsCount > 1 ? 's' : '' }} disponible{{ filteredActorsCount > 1 ? 's' : '' }}
          </p>
        </div>
      </div>
    </section>

    <!-- Section Filters -->
    <section class="border-b border-[#292d3e]">
      <div class="container mx-auto px-6 lg:px-12 py-8 flex flex-col lg:flex-row gap-6 lg:items-center lg:justify-between">

        <Select v-model="selectedDecade">
          <SelectTrigger class="w-full lg:w-[260px] bg-[#1b1e29] border border-[#292d3e] text-white hover:border-[#f43a00] hover:cursor-pointer">
            <SelectValue placeholder="Toutes les décennies" />
          </SelectTrigger>
          <SelectContent class="bg-[#1b1e29] border-[#292d3e]">
            <SelectGroup>
              <SelectItem :value="null" class="text-white hover:bg-[#13151d]">
                Toutes les décennies
              </SelectItem>
              <SelectItem
                  v-for="decade in decades"
                  :key="decade.id"
                  :value="decade.id"
                  class="text-white hover:bg-[#13151d]"
              >
                {{ decade.label }}
              </SelectItem>
            </SelectGroup>
          </SelectContent>
        </Select>

        <div class="relative w-full lg:w-[400px]">
          <input
              v-model="searchQuery"
              type="text"
              placeholder="Rechercher un acteur..."
              class="w-full px-4 py-3 pl-10 bg-[#1b1e29] border border-[#292d3e] rounded-lg text-white placeholder-gray-500 hover:border-[#f43a00] focus:outline-none focus:border-[#f43a00]"
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

    <!-- Section Actors -->
    <section>
      <div class="container mx-auto px-6 lg:px-12 py-16">

        <div v-if="filteredActors.length" class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
          <div
              v-for="actor in filteredActors"
              :key="actor.node.id"
              class="relative group rounded-xl overflow-hidden"
          >
            <!-- Image avec dégradé -->
            <div class="relative h-72">
              <img
                  src="/images/brad-pitt.jpg"
                  alt="Photo de l'acteur"
                  class="w-full h-full object-cover"
              />
              <div class="absolute inset-0 bg-gradient-to-t from-black via-transparent"></div>
            </div>

            <!-- Texte sur le dégradé (visible au survol) -->
            <div class="absolute bottom-4 left-4 right-4 text-white opacity-0 group-hover:opacity-100 transition-opacity">
              <h3 class="font-semibold text-lg text-[#f43a00]">
                {{ actor.node.firstname }} {{ actor.node.lastname }}
              </h3>
            </div>
          </div>
        </div>

        <div v-else class="text-center py-24 text-gray-500">
          Aucun acteur ne correspond à votre recherche.
        </div>

      </div>
    </section>

  </div>
</template>
