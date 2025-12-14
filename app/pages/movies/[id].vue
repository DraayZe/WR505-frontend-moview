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
  <div class="min-h-screen py-10 px-4">
    <div class="max-w-4xl mx-auto">

      <NuxtLink
          to="/"
          class="text-sm text-black hover:text-emerald-700 mb-6 inline-block"
      >
        ← Retour aux films
      </NuxtLink>

      <div v-if="pending">Chargement…</div>
      <div v-if="error">Erreur</div>

      <div v-if="data?.movie">
        <h1 class="text-4xl font-bold text-[#262620] mb-4">
          {{ data.movie.name }}
        </h1>

        <!-- CATEGORIES -->
        <div
            v-if="data.movie.categories.edges.length"
            class="flex flex-wrap gap-2 mb-6"
        >
          <span
              v-for="cat in data.movie.categories.edges"
              :key="cat.node.id"
              class="text-sm px-3 py-1 rounded-full bg-[#899878]/15 text-[#262620]"
          >
            {{ cat.node.name }}
          </span>
        </div>

        <!-- DESCRIPTION -->
        <p class="text-[#262620] leading-relaxed">
          {{ data.movie.description || 'Aucune description' }}
        </p>
        <!-- ACTEURS -->
        <div class="mt-10">
          <h2 class="text-xl font-semibold text-[#262620] mb-3">
            Acteurs
          </h2>

          <ul
              v-if="data.movie.actors.edges.length"
              class="grid grid-cols-2 sm:grid-cols-3 gap-3"
          >
            <li
                v-for="actor in data.movie.actors.edges"
                :key="actor.node.id"
                class="bg-white border border-[#899878]/20 rounded px-3 py-2 text-sm"
            >
              {{ actor.node.firstname }} {{ actor.node.lastname }}
            </li>
          </ul>

          <p v-else class="text-sm text-[#899878]/60 italic">
            Aucun acteur renseigné
          </p>
        </div>

        <!-- REALISATEUR -->
        <div class="mt-10">
          <h2 class="text-xl font-semibold text-[#262620] mb-3">
            Réalisateur
          </h2>

          <p v-if="data.movie.director">
            {{ data.movie.director.firstname }}
            {{ data.movie.director.lastname }}
          </p>

          <p v-else class="text-sm text-[#899878]/60 italic">
            Aucun réalisateur renseigné
          </p>
        </div>

      </div>

    </div>
  </div>
</template>
