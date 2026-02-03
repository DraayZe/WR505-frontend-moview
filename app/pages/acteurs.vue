<script setup lang="ts">
import { Search, Filter, Users, Calendar } from 'lucide-vue-next'

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

const getAge = (dob: string) => {
  if (!dob) return null
  const birthDate = new Date(dob)
  const today = new Date()
  let age = today.getFullYear() - birthDate.getFullYear()
  const monthDiff = today.getMonth() - birthDate.getMonth()
  if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) {
    age--
  }
  return age
}

const formatBirthYear = (dob: string) => {
  if (!dob) return null
  return new Date(dob).getFullYear()
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
  <div class="min-h-screen bg-[#0a0a0c]">
    <section class="relative pt-32 pb-20 overflow-hidden">
      <div class="absolute inset-0">
        <div class="absolute top-0 right-1/4 w-96 h-96 bg-[#d4af37]/5 rounded-full blur-3xl"></div>
        <div class="absolute bottom-0 left-1/4 w-80 h-80 bg-[#d4af37]/3 rounded-full blur-3xl"></div>
      </div>

      <div class="absolute left-8 top-0 bottom-0 w-px bg-gradient-to-b from-transparent via-[#d4af37]/20 to-transparent"></div>
      <div class="absolute right-8 top-0 bottom-0 w-px bg-gradient-to-b from-transparent via-[#d4af37]/20 to-transparent"></div>

      <div class="relative z-10 container mx-auto px-6 lg:px-12">
        <div class="max-w-3xl">
          <div class="flex items-center gap-4 mb-6">
            <Users class="w-5 h-5 text-[#d4af37]" />
            <span class="text-[#d4af37] text-sm tracking-[0.3em] uppercase font-body">Talents</span>
          </div>

          <h1 class="font-display text-5xl lg:text-6xl text-white mb-6">
            Catalogue d'<span class="italic text-gold-gradient">acteurs</span>
          </h1>

          <p class="font-body text-[#c0c0c0] text-lg mb-4">
            Découvrez les visages qui font vivre le cinéma et donnent vie aux plus grands personnages.
          </p>

          <p class="font-body text-[#d4af37]">
            {{ filteredActorsCount }} acteur{{ filteredActorsCount > 1 ? 's' : '' }} disponible{{ filteredActorsCount > 1 ? 's' : '' }}
          </p>
        </div>
      </div>
    </section>

    <section class="border-y border-[#d4af37]/10 bg-[#0a0a0c]/80 backdrop-blur-sm sticky top-[72px] z-40">
      <div class="container mx-auto px-6 lg:px-12 py-6">
        <div class="flex flex-col lg:flex-row gap-6 lg:items-center lg:justify-between">
          <div class="flex flex-col sm:flex-row gap-4">
            <Select v-model="selectedDecade">
              <SelectTrigger class="w-full sm:w-[240px] bg-[#12121a] border border-[#d4af37]/20 text-white hover:border-[#d4af37] transition-colors duration-300 cursor-pointer font-body">
                <div class="flex items-center gap-2">
                  <Calendar class="w-4 h-4 text-[#d4af37]" />
                  <SelectValue placeholder="Toutes les décennies" />
                </div>
              </SelectTrigger>
              <SelectContent class="bg-[#12121a] border border-[#d4af37]/20">
                <SelectGroup>
                  <SelectItem :value="null" class="text-white hover:bg-[#d4af37]/10 cursor-pointer font-body">
                    Toutes les décennies
                  </SelectItem>
                  <SelectItem
                    v-for="decade in decades"
                    :key="decade.id"
                    :value="decade.id"
                    class="text-white hover:bg-[#d4af37]/10 cursor-pointer font-body"
                  >
                    {{ decade.label }}
                  </SelectItem>
                </SelectGroup>
              </SelectContent>
            </Select>

            <div class="relative w-full sm:w-[300px]">
              <Search class="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-[#d4af37]/50" />
              <input
                v-model="searchQuery"
                type="text"
                placeholder="Rechercher un acteur..."
                class="w-full pl-12 pr-4 py-3 bg-[#12121a] border border-[#d4af37]/20 text-white placeholder-[#c0c0c0]/40 font-body focus:outline-none focus:border-[#d4af37] transition-colors duration-300"
              />
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-16">
      <div class="container mx-auto px-6 lg:px-12">
        <div v-if="filteredActors.length" class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-6">
          <div
            v-for="(actor, index) in filteredActors"
            :key="actor.node.id"
            class="group relative overflow-hidden bg-[#12121a]"
          >
            <div class="relative aspect-[3/4]">
              <img
                src="/images/brad-pitt.jpg"
                :alt="`${actor.node.firstname} ${actor.node.lastname}`"
                class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
              />

              <div class="absolute inset-0 bg-gradient-to-t from-[#0a0a0c] via-[#0a0a0c]/30 to-transparent opacity-70 group-hover:opacity-90 transition-opacity duration-300"></div>

              <div class="absolute inset-0 border border-[#d4af37]/0 group-hover:border-[#d4af37]/40 transition-all duration-300"></div>

              <div class="absolute inset-0 flex flex-col justify-end p-5">
                <div
                  v-if="formatBirthYear(actor.node.dob)"
                  class="absolute top-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
                >
                  <div class="px-3 py-1 bg-[#d4af37]/20 border border-[#d4af37]/30 text-[#d4af37] text-xs font-body">
                    {{ formatBirthYear(actor.node.dob) }}
                  </div>
                </div>

                <h3 class="font-display text-xl text-white group-hover:text-[#f4e4a6] transition-colors duration-300">
                  {{ actor.node.firstname }}
                </h3>
                <h3 class="font-display text-2xl text-white group-hover:text-[#f4e4a6] transition-colors duration-300">
                  {{ actor.node.lastname }}
                </h3>

                <p v-if="getAge(actor.node.dob)" class="font-body text-sm text-[#c0c0c0] mt-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                  {{ getAge(actor.node.dob) }} ans
                </p>

                <div class="mt-4 h-px w-0 bg-gradient-to-r from-[#d4af37] to-transparent group-hover:w-full transition-all duration-500"></div>
              </div>

              <div class="absolute top-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                <div class="w-8 h-8 bg-[#d4af37] flex items-center justify-center">
                  <span class="font-display font-bold text-[#0a0a0c] text-sm">{{ index + 1 }}</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div v-else class="text-center py-24">
          <Users class="w-16 h-16 text-[#d4af37]/20 mx-auto mb-6" />
          <h3 class="font-display text-2xl text-white mb-2">Aucun acteur trouvé</h3>
          <p class="font-body text-[#c0c0c0]">Aucun acteur ne correspond à votre recherche.</p>
        </div>
      </div>
    </section>
  </div>
</template>
