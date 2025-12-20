<script setup lang="ts">
import { ref, onMounted } from 'vue'

const reviewsApi = useReviews()
const movie = ref<{ id: string; name: string; description: string } | null>(null)
const reviews = ref<any[]>([])
const loadingReviews = ref(false)

const query = `
query ($name: String) {
  movies(name: $name) {
    edges {
      node {
        id
        name
        description
      }
    }
  }
}
`

type MovieQuery = {
  movies: {
    edges: {
      node: {
        id: string
        name: string
        description: string
      }
    }[]
  }
}

const formatDate = (dateString: string) => {
  const date = new Date(dateString)
  return date.toLocaleDateString('fr-FR', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  })
}

onMounted(async () => {
  const { data } = await useAsyncGqlPulse<MovieQuery>({
    client: 'backendapi',
    document: query,
    variables: { name: 'Forrest Gump' }
  })

  // On récupère le premier résultat (le film Forrest Gump)
  movie.value = data.value?.movies?.edges[0]?.node ?? null

  // Charger les reviews si le film existe
  if (movie.value?.id) {
    loadingReviews.value = true
    try {
      const response: any = await reviewsApi.getMovieReviews(movie.value.id)
      // Limiter aux 4 premières reviews
      reviews.value = (response['member'] || response['hydra:member'] || []).slice(0, 4)
    } catch (error) {
      console.error('Erreur lors du chargement des reviews:', error)
    } finally {
      loadingReviews.value = false
    }
  }
})


const getIdFromIri = (iri: string) => iri.split('/').pop()!


</script>

<template>

  <div class="relative h-[calc(100vh-64px)] bg-gradient-to-br from-[#1b1e29] via-[#252837] to-[#1b1e29] overflow-hidden ">
    <div class="relative z-10 flex items-center h-full ">
      <div class="container mx-auto px-6 lg:px-12">
        <div class="max-w-2xl">
          <h1 class="text-5xl lg:text-7xl text-white mb-6 leading-tight font-display">
           L'univers du cinéma
          </h1>
          <p class="text-xl text-gray-300 mb-10 leading-relaxed font-body">
            Explorez notre collection complète de films, acteurs, réalisateurs et donnez votre avis.
          </p>
          <div class="flex flex-wrap gap-4">
            <NuxtLink to="/movies" class="font-body px-8 py-4 bg-gradient-to-r from-[#f43a00] to-[#b12f01] text-white rounded-lg font-medium hover:opacity-90 transition shadow-lg inline-flex items-center gap-2">
              Parcourir les films
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6" />
              </svg>
            </NuxtLink>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="bg-[#13151d] py-24 border-t border-[#292d3e]">
    <div class="container mx-auto px-6 lg:px-12">

      <div class="max-w-2xl mb-16">
        <h2 class="text-4xl text-white font-body mb-4">
          Que pouvez-vous faire sur L’univers du cinéma ?
        </h2>
        <p class="text-gray-400 text-lg font-body">
          Une plateforme pensée pour les passionnés de cinéma, du simple spectateur au cinéphile averti.
        </p>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">

        <div class="bg-[#1b1e29] border border-[#292d3e] rounded-xl p-8 hover:border-[#f43a00] transition">
          <h3 class="text-xl text-white font-body mb-3">
            Explorez des milliers de films
          </h3>
          <p class="text-gray-400 font-body leading-relaxed">
            Parcourez une vaste base de données de films, des classiques intemporels aux dernières sorties.
          </p>
        </div>

        <div class="bg-[#1b1e29] border border-[#292d3e] rounded-xl p-8 hover:border-[#f43a00] transition">
          <h3 class="text-xl text-white font-body mb-3">
            Donnez votre avis
          </h3>
          <p class="text-gray-400 font-body leading-relaxed">
            Notez les films, partagez vos critiques et découvrez l’opinion de la communauté.
          </p>
        </div>

        <div class="bg-[#1b1e29] border border-[#292d3e] rounded-xl p-8 hover:border-[#f43a00] transition">
          <h3 class="text-xl text-white font-body mb-3">
            Découvrez les talents du cinéma
          </h3>
          <p class="text-gray-400 font-body leading-relaxed">
            Explorez les fiches des acteurs, réalisateurs et équipes qui font vivre le 7ᵉ art.
          </p>
        </div>

      </div>
    </div>
  </div>


  <div v-if="movie" class="relative w-full h-[1000px] overflow-hidden group">
    <div
        class="absolute inset-0 bg-cover bg-center"
        style="background-image: url('/images/oblivion.jpg')";
    ></div>

    <div class="absolute inset-0 bg-gradient-to-t from-[#1b1e29] via-[#1b1e29]/60 to-transparent"></div>

    <div class="relative z-10 container mx-auto px-6 lg:px-12 h-full flex flex-col justify-end pb-20">
      <h2 class="text-5xl lg:text-7xl font-bold text-white mb-4">{{ movie.name }}</h2>
      <div>
        <p class="text-gray-200 text-lg max-w-2xl mb-8 leading-relaxed shadow-black drop-shadow-md">
        {{ movie.description }}
      </p>
        <div class="flex items-center">
          <NuxtLink class="px-8 py-3 bg-[#f43a00] text-white font-bold rounded hover:bg-[#b12f01] hover:cursor-pointer"
                    :to="`/movies/${getIdFromIri(movie.id)}`">
            Voir le film
          </NuxtLink>
        </div>
      </div>
    </div>
  </div>

  <div v-else class="text-center py-24 text-gray-500">
    Chargement du film...
  </div>

  <div class="bg-[#1b1e29] py-20 relative">
    <div class="text-center mb-12">
      <h2 class="text-3xl lg:text-4xl font-body text-white">
        Les avis de {{ movie?.name || 'Forrest Gump' }}
      </h2>
    </div>

    <div class="container mx-auto px-6 lg:px-12">
      <div v-if="loadingReviews" class="text-center text-gray-400 font-body">
        Chargement des avis...
      </div>

      <div v-else-if="reviews.length === 0" class="text-center text-gray-400 font-body">
        Aucun avis disponible pour ce film.
      </div>

      <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <div v-for="review in reviews" :key="review.id"
             class="p-6 rounded-lg border flex flex-col h-full transition-transform hover:-translate-y-1 bg-transparent border-[#292d3e] text-gray-300 hover:border-gray-500">

          <div class="flex items-center gap-3 mb-4">
            <div class="w-10 h-10 rounded-full bg-gradient-to-br from-[#f43a00] to-[#b12f01] flex items-center justify-center">
              <span class="text-white font-body font-bold text-sm">
                {{ review.user?.email?.[0]?.toUpperCase() || 'U' }}
              </span>
            </div>
            <div>
              <div class="font-bold text-sm text-white" >
                {{ review.user?.email || 'Utilisateur' }}
              </div>
            </div>
          </div>

          <div class="flex items-center gap-1 mb-3">
            <span
                v-for="star in 5"
                :key="star"
                class="text-xl"
                :class="star <= review.rating ? 'text-yellow-400' : 'text-gray-600'"
            >
              ★
            </span>

          </div>

          <p class="text-sm leading-relaxed mb-4 flex-grow text-gray-400" >
            {{ review.comment }}
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>

</style>