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
      label: `${year} - ${year + 10}`
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
    actors = actors.filter(actor => getDecade(actor.node.dob) === selectedDecade.value)
  }

  if (searchQuery.value.trim()) {
    const query = searchQuery.value.toLowerCase().trim()
    actors = actors.filter(actor =>
      actor.node.firstname.toLowerCase().includes(query) ||
      actor.node.lastname.toLowerCase().includes(query)
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
            Catalogue des acteurs
          </h1>
          <p class="text-black/50">
            Découvrez notre sélection d'acteurs.
          </p>
          <p class="text-black/50 mt-1">
            {{ filteredActorsCount }} acteur{{ filteredActorsCount > 1 ? 's' : '' }} disponible{{ filteredActorsCount > 1 ? 's' : '' }}
          </p>
        </div>
      <section>
        <Select v-model="selectedDecade">
          <SelectTrigger class="w-[250px] hover:cursor-pointer ">
            <SelectValue placeholder="Toutes les décennies" class="text-black"/>
          </SelectTrigger>
          <SelectContent>
            <SelectGroup>
              <SelectLabel>Décennie de naissance</SelectLabel>
              <SelectItem :value="null" class="hover:cursor-pointer">
                Toutes les décennies
              </SelectItem>
              <SelectItem v-for="decade in decades" :key="decade.id" :value="decade.id" class="hover:cursor-pointer">
                {{ decade.label }}
              </SelectItem>
            </SelectGroup>
          </SelectContent>
        </Select>
      </section>  </div>

      <section>
        <div class="relative">
          <input v-model="searchQuery" type="text" placeholder="Rechercher un acteur..." class="w-full px-4 py-3 pl-10 bg-white border border-gray-300 rounded-lg text-gray-900 placeholder-gray-400 focus:outline-none focus:border-emerald-500 focus:ring-1 focus:ring-emerald-200 transition-all"/>
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400 absolute left-3 top-1/2 -translate-y-1/2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
          </svg>
        </div>
      </section>

      <section>
        <h3 class="text-2xl font-bold mb-6 text-gray-900">
          Catalogue
        </h3>
        <div v-if="filteredActors.length" class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-6">
          <div v-for="actor in filteredActors" :key="actor.node.id" class="bg-white/80 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 hover:cursor-pointer block">
            <div class="h-40 bg-white rounded-t-xl flex items-center justify-center border-b border-black/50">
            </div>

            <div class="p-4">
              <p class="font-semibold text-gray-900 mb-2">
                {{ actor.node.firstname }} {{ actor.node.lastname }}
              </p>

              <p v-if="actor.node.dob" class="text-xs text-gray-600">
                Né(e) en {{ new Date(actor.node.dob).getFullYear() }}
              </p>
            </div>
          </div>
        </div>

        <div v-else class="text-center py-20 text-gray-500">
          Aucun acteur disponible
        </div>
      </section>

    </main>
  </div>
</template>
