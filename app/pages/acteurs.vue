<script setup lang="ts">
const query = `
query{
  actors{
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

const getIdFromIri = (iri: string) => iri.split('/').pop()!

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
  <div class="min-h-screen bg-[#13151d] ">

    <section class="bg-gradient-to-br from-[#1b1e29] via-[#252837] to-[#1b1e29] border-b border-[#292d3e]">
      <div class="container mx-auto px-6 lg:px-12 py-40">
        <div class="max-w-3xl">
          <h1 class="text-5xl text-white font-body mb-4">
            Catalogue des acteurs
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

    <section>
      <div class="container mx-auto px-6 lg:px-12 py-16">

        <div
            v-if="filteredActors.length"
            class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-8"
        >
          <NuxtLink
              v-for="actor in filteredActors"
              :key="actor.node.id"
              :to="`/actors/${getIdFromIri(actor.node.id)}`"
              class="group bg-[#1b1e29] border border-[#292d3e] rounded-xl overflow-hidden hover:border-[#f43a00] transition"
          >
            <!-- Photo -->
            <div class="h-56 bg-gradient-to-br from-[#252837] to-[#1b1e29] flex items-center justify-center text-gray-500 text-3xl">
              👤
            </div>

            <div class="p-5">
              <h3 class="text-white font-body font-semibold mb-1 group-hover:text-[#f43a00] transition">
                {{ actor.node.firstname }} {{ actor.node.lastname }}
              </h3>
              <p v-if="actor.node.dob" class="text-sm text-gray-400">
                Né(e) en {{ new Date(actor.node.dob).getFullYear() }}
              </p>
            </div>
          </NuxtLink>
        </div>

        <div v-else class="text-center py-24 text-gray-500">
          Aucun acteur ne correspond à votre recherche.
        </div>

      </div>
    </section>

  </div>
</template>
