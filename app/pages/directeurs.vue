<script setup lang="ts">
import { Search, Clapperboard, Calendar } from 'lucide-vue-next'

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

const getAge = (dob: string, dod: string | null) => {
  if (!dob) return null
  const birthDate = new Date(dob)
  const endDate = dod ? new Date(dod) : new Date()
  let age = endDate.getFullYear() - birthDate.getFullYear()
  const monthDiff = endDate.getMonth() - birthDate.getMonth()
  if (monthDiff < 0 || (monthDiff === 0 && endDate.getDate() < birthDate.getDate())) {
    age--
  }
  return age
}

const formatBirthYear = (dob: string) => {
  if (!dob) return null
  return new Date(dob).getFullYear()
}

const formatDeathYear = (dod: string | null) => {
  if (!dod) return null
  return new Date(dod).getFullYear()
}

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
  <div class="min-h-screen bg-[#0a0a0c]">
    <section class="relative pt-32 pb-20 overflow-hidden">
      <div class="absolute inset-0">
        <div class="absolute top-0 left-1/3 w-96 h-96 bg-[#d4af37]/5 rounded-full blur-3xl"></div>
        <div class="absolute bottom-0 right-1/3 w-80 h-80 bg-[#d4af37]/3 rounded-full blur-3xl"></div>
      </div>

      <div class="absolute left-8 top-0 bottom-0 w-px bg-gradient-to-b from-transparent via-[#d4af37]/20 to-transparent"></div>
      <div class="absolute right-8 top-0 bottom-0 w-px bg-gradient-to-b from-transparent via-[#d4af37]/20 to-transparent"></div>

      <div class="relative z-10 container mx-auto px-6 lg:px-12">
        <div class="max-w-3xl">
          <div class="flex items-center gap-4 mb-6">
            <Clapperboard class="w-5 h-5 text-[#d4af37]" />
            <span class="text-[#d4af37] text-sm tracking-[0.3em] uppercase font-body">Visionnaires</span>
          </div>

          <h1 class="font-display text-5xl lg:text-6xl text-white mb-6">
            Catalogue de <span class="italic text-gold-gradient">réalisateurs</span>
          </h1>

          <p class="font-body text-[#c0c0c0] text-lg mb-4">
            Découvrez les talents qui façonnent le 7ᵉ art et créent des chefs-d'oeuvre cinématographiques.
          </p>

          <p class="font-body text-[#d4af37]">
            {{ filteredDirectorsCount }} réalisateur{{ filteredDirectorsCount > 1 ? 's' : '' }} disponible{{ filteredDirectorsCount > 1 ? 's' : '' }}
          </p>
        </div>
      </div>
    </section>

    <section class="border-y border-[#d4af37]/10 bg-[#0a0a0c]/80 backdrop-blur-sm sticky top-[72px] z-40">
      <div class="container mx-auto px-6 lg:px-12 py-6">
        <div class="flex flex-col lg:flex-row gap-6 lg:items-center lg:justify-between">
          <div class="relative w-full lg:w-[400px]">
            <Search class="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-[#d4af37]/50" />
            <input
              v-model="searchQuery"
              type="text"
              placeholder="Rechercher un réalisateur..."
              class="w-full pl-12 pr-4 py-3 bg-[#12121a] border border-[#d4af37]/20 text-white placeholder-[#c0c0c0]/40 font-body focus:outline-none focus:border-[#d4af37] transition-colors duration-300"
            />
          </div>
        </div>
      </div>
    </section>

    <section class="py-16">
      <div class="container mx-auto px-6 lg:px-12">
        <div v-if="filteredDirectors.length" class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-6">
          <div
            v-for="(director, index) in filteredDirectors"
            :key="director.node.id"
            class="group relative overflow-hidden bg-[#12121a]"
          >
            <div class="relative aspect-[3/4]">
              <img
                src="/images/christopher-nolan.jpg"
                :alt="`${director.node.firstname} ${director.node.lastname}`"
                class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
              />
              <div class="absolute inset-0 bg-gradient-to-t from-[#0a0a0c] via-[#0a0a0c]/30 to-transparent opacity-70 group-hover:opacity-90 transition-opacity duration-300"></div>
              <div class="absolute inset-0 border border-[#d4af37]/0 group-hover:border-[#d4af37]/40 transition-all duration-300"></div>

              <div class="absolute inset-0 flex flex-col justify-end p-5">
                <div
                  v-if="formatBirthYear(director.node.dob)"
                  class="absolute top-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
                >
                  <div class="px-3 py-1 bg-[#d4af37]/20 border border-[#d4af37]/30 text-[#d4af37] text-xs font-body flex items-center gap-1">
                    <Calendar class="w-3 h-3" />
                    {{ formatBirthYear(director.node.dob) }}
                    <span v-if="formatDeathYear(director.node.dod)">
                      - {{ formatDeathYear(director.node.dod) }}
                    </span>
                  </div>
                </div>

                <h3 class="font-display text-xl text-white group-hover:text-[#f4e4a6] transition-colors duration-300">
                  {{ director.node.firstname }}
                </h3>
                <h3 class="font-display text-2xl text-white group-hover:text-[#f4e4a6] transition-colors duration-300">
                  {{ director.node.lastname }}
                </h3>

                <div class="flex items-center gap-2 mt-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                  <div
                    class="w-2 h-2 rounded-full"
                    :class="director.node.dod ? 'bg-[#c0c0c0]' : 'bg-[#d4af37]'"
                  ></div>
                  <p class="font-body text-sm text-[#c0c0c0]">
                    <template v-if="director.node.dod">
                      {{ getAge(director.node.dob, director.node.dod) }} ans (décédé)
                    </template>
                    <template v-else-if="getAge(director.node.dob, null)">
                      {{ getAge(director.node.dob, null) }} ans
                    </template>
                  </p>
                </div>

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
          <Clapperboard class="w-16 h-16 text-[#d4af37]/20 mx-auto mb-6" />
          <h3 class="font-display text-2xl text-white mb-2">Aucun réalisateur trouvé</h3>
          <p class="font-body text-[#c0c0c0]">Aucun réalisateur ne correspond à votre recherche.</p>
        </div>
      </div>
    </section>
  </div>
</template>
