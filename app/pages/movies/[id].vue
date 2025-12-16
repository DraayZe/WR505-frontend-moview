<!--[id].vue-->
<script setup lang="ts">
const route = useRoute()

const query = `
query ($id: ID!) {
  movie(id: $id) {
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

    actors {
      edges {
        node {
          id
          firstname
          lastname
        }
      }
    }

    director {
      id
      firstname
      lastname
    }
  }
}

`

type MovieQuery = {
  movie: {
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

    actors: {
      edges: {
        node: {
          id: string
          firstname: string
          lastname: string
        }
      }[]
    }

    director: {
      id: string
      firstname: string
      lastname: string
    } | null
  }
}


const { data, pending, error } = await useAsyncGqlPulse<MovieQuery>({
  client: 'backendapi',
  document: query,
  variables: {
    id: `/api/movies/${route.params.id}`,
  },
})

</script>

<template>
  <div class="min-h-screen bg-[#13151d]">

    <!-- HERO / BANNER -->
    <section class="relative overflow-hidden border-b border-[#292d3e]">
      <!-- Background image (placeholder) -->
      <div class="absolute inset-0 bg-cover bg-center"
           style="background-image: url('/images/oblivion.jpg');">
      </div>

      <!-- Overlays -->
      <div class="absolute inset-0 bg-black/60"></div>
      <div class="absolute inset-0 bg-gradient-to-t from-[#13151d] via-[#13151d]/70 to-transparent"></div>

      <!-- Content -->
      <div class="relative z-10 container mx-auto px-6 lg:px-12 py-14 lg:py-20">

        <NuxtLink
            to="/movies"
            class="inline-flex items-center gap-2 text-sm text-gray-300 hover:text-[#f43a00] transition font-body mb-8"
        >
          <span class="text-lg">←</span> Retour aux films
        </NuxtLink>

        <div v-if="pending" class="text-gray-300 font-body">Chargement…</div>
        <div v-else-if="error" class="text-red-400 font-body">Erreur lors du chargement.</div>

        <div v-else-if="data?.movie" class="max-w-4xl">
          <h1 class="text-4xl lg:text-6xl text-white font-display mb-4">
            {{ data.movie.name }}
          </h1>

          <!-- Categories -->
          <div
              v-if="data.movie.categories.edges.length"
              class="flex flex-wrap gap-2 mb-6"
          >
            <span
                v-for="cat in data.movie.categories.edges"
                :key="cat.node.id"
                class="text-xs font-body px-3 py-1 rounded-full
                     bg-[#1b1e29] border border-[#292d3e]
                     text-gray-200"
            >
              {{ cat.node.name }}
            </span>
          </div>

          <!-- Description -->
          <p class="text-gray-200/90 font-body leading-relaxed text-base lg:text-lg max-w-3xl">
            {{ data.movie.description || 'Aucune description disponible.' }}
          </p>

          <div class="mt-8 flex flex-wrap gap-4">
            <button
                class="px-7 py-3 rounded-lg font-body font-semibold text-white
                     bg-gradient-to-r from-[#f43a00] to-[#b12f01]
                     hover:opacity-90 hover:cursor-pointer transition shadow-lg shadow-[#f43a00]/20"
            >
              Donner un avis
            </button>

            <NuxtLink
                to="/movies"
                class="px-7 py-3 rounded-lg font-body font-semibold
                     bg-[#1b1e29] border border-[#292d3e]
                     text-gray-200 hover:border-[#f43a00] transition"
            >
              Voir d’autres films
            </NuxtLink>
          </div>
        </div>

      </div>
    </section>

    <section v-if="data?.movie" class="container mx-auto px-6 lg:px-12 py-14">
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-10">

        <div class="lg:col-span-1">
          <div class="bg-[#1b1e29] border border-[#292d3e] rounded-2xl overflow-hidden">
            <div class="relative aspect-[2/3] bg-[#252837] overflow-hidden">
              <img
                  src="/images/pulp-fiction.jpg"
                  alt="Poster du film"
                  class="absolute inset-0 w-full h-full object-cover"
              />
            </div>
          </div>
        </div>

        <div class="lg:col-span-2 space-y-10">

          <div class="bg-[#1b1e29] border border-[#292d3e] rounded-2xl p-8">
            <h2 class="text-xl text-white font-body font-semibold mb-4">
              Réalisateur
            </h2>

            <div v-if="data.movie.director" class="flex items-center justify-between">
              <p class="text-gray-200 font-body">
                {{ data.movie.director.firstname }} {{ data.movie.director.lastname }}
              </p>

              <span class="text-xs px-3 py-1 rounded-full bg-[#13151d] border border-[#292d3e] text-gray-400">
                Crédit principal
              </span>
            </div>

            <p v-else class="text-sm text-gray-500 italic font-body">
              Aucun réalisateur renseigné
            </p>
          </div>

          <div class="bg-[#1b1e29] border border-[#292d3e] rounded-2xl p-8">
            <h2 class="text-xl text-white font-body font-semibold mb-4">
              Acteurs
            </h2>

            <ul
                v-if="data.movie.actors.edges.length"
                class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4"
            >
              <li
                  v-for="actor in data.movie.actors.edges"
                  :key="actor.node.id"
                  class="bg-[#13151d] border border-[#292d3e] rounded-xl p-4
                       hover:border-[#f43a00] transition"
              >
                <p class="text-white font-body font-semibold">
                  {{ actor.node.firstname }} {{ actor.node.lastname }}
                </p>
                <p class="text-xs text-gray-500 mt-1">
                  Acteur / Actrice
                </p>
              </li>
            </ul>

            <p v-else class="text-sm text-gray-500 italic font-body">
              Aucun acteur renseigné
            </p>
          </div>

        </div>
      </div>
    </section>

  </div>
</template>

