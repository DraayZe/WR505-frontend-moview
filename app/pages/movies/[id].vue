<script setup lang="ts">
const route = useRoute()
const { isAuthenticated, user } = useAuth()
const reviewsApi = useReviews()

const query = `
query ($id: ID!) {
  movie(id: $id) {
    id
    name
    description
    duration

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
    duration:integer

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

const reviews = ref<any[]>([])
console.log(reviews)
const loadingReviews = ref(false)
const showReviewForm = ref(false)


const reviewForm = ref({
  rating: 0,
  comment: '',
})

const hoverRating = ref(0)
const submittingReview = ref(false)
const reviewSuccess = ref(false)

const loadReviews = async (movieIri: string) => {
  loadingReviews.value = true
  try {
    const response: any = await reviewsApi.getMovieReviews(movieIri)
    reviews.value = response['member'] || response['hydra:member'] || []
  } catch (error) {
    console.error('Erreur lors du chargement des reviews:', error)
  } finally {
    loadingReviews.value = false
  }
}


const submitReview = async () => {
  if (!reviewForm.value.rating || !reviewForm.value.comment.trim()) {
    return
  }

  submittingReview.value = true
  reviewSuccess.value = false

  try {
    await reviewsApi.createReview({
      movie: `/api/movies/${route.params.id}`,
      comment: reviewForm.value.comment,
      rating: reviewForm.value.rating,
    })

    reviewSuccess.value = true
    reviewForm.value = {
      rating: 0,
      comment: '',
    }
    showReviewForm.value = false

    await loadReviews()
  } catch (error) {
    console.error('Erreur:', error)
  } finally {
    submittingReview.value = false
  }
}

const setRating = (rating: number) => {
  reviewForm.value.rating = rating
}

const formatDate = (dateString: string) => {
  const date = new Date(dateString)
  return date.toLocaleDateString('fr-FR', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  })
}

const averageRating = computed(() => {
  if (reviews.value.length === 0) return 0
  const sum = reviews.value.reduce((acc, review) => acc + review.rating, 0)
  return (sum / reviews.value.length).toFixed(1)
})

onMounted(() => {
  if (data.value?.movie?.id) {
    loadReviews(data.value.movie.id)
  }
})

const scrollToReviews = () => {
  const el = document.getElementById('reviews')
  if (el) {
    el.scrollIntoView({ behavior: 'smooth', block: 'start' })
  }
}

</script>

<template>
  <div class="bg-[#13151d]">
    <section class="min-h-screen  relative overflow-hidden border-b border-[#292d3e]">
      <div class="absolute inset-0 bg-cover bg-center"
           style="background-image: url('/images/oblivion.jpg');">
      </div>

      <div class="absolute inset-0 bg-black/60"></div>
      <div class="absolute inset-0 bg-gradient-to-t from-[#13151d] via-[#13151d]/70 to-transparent"></div>

      <div class="relative z-10 container mx-auto px-6 lg:px-12 py-14 lg:py-20 min-h-screen flex flex-col">
        <h1 v-if="data?.movie" class="text-4xl lg:text-7xl text-white font-body mb-8">
          {{ data.movie.name }}
        </h1>

        <div class="mt-auto">
          <div
              v-if="data?.movie"
              class="flex flex-row items-end justify-between gap-12"
          >
            <div class="flex flex-col gap-4 shrink-0">
              <button
                  v-if="isAuthenticated"
                  @click="
    showReviewForm = true;
    scrollToReviews()
  "
                  class="px-7 py-4 rounded-lg font-body font-semibold text-white
         bg-gradient-to-r from-[#f43a00] to-[#b12f01]
         hover:opacity-90 hover:cursor-pointer transition shadow-lg shadow-[#f43a00]/20"
              >
                Donner un avis
              </button>
              <NuxtLink
                  v-else
                  to="/login"
                  class="px-7 py-4 rounded-lg text-center font-body font-semibold text-white
               bg-gradient-to-r from-[#f43a00] to-[#b12f01]
               hover:opacity-90 hover:cursor-pointer transition shadow-lg shadow-[#f43a00]/20"
              >
                Connectez-vous pour donner un avis
              </NuxtLink>
              <div
                  class="px-7 py-4 rounded-lg text-center font-body font-semibold
               bg-[#1b1e29] border border-[#292d3e]
               text-gray-200 hover:cursor-pointer hover:border-[#f43a00] transition"
              >
                Marqué comme vu
              </div>
              <NuxtLink
                  to="/movies"
                  class="px-7 py-4 rounded-lg text-center font-body font-semibold
               bg-[#1b1e29] border border-[#292d3e]
               text-gray-200 hover:cursor-pointer hover:border-[#f43a00] transition"
              >
                Voir d'autres films
              </NuxtLink>
            </div>

            <div class="flex flex-col gap-4 flex-1">
              <p class="text-gray-200/90 font-body leading-relaxed text-base lg:text-lg">
                {{ data.movie.description || 'Aucune description disponible.' }}
              </p>
              <div class="flex flex-row gap-4">
              <div v-if="data.movie.categories.edges.length"
                  class="flex flex-wrap gap-2">
        <span v-for="cat in data.movie.categories.edges" :key="cat.node.id"
            class="text-xs font-body px-3 py-1 rounded-full
                 bg-[#1b1e29] border border-[#292d3e] text-gray-200"
        >
          {{ cat.node.name }}
        </span>
              </div>

              <div v-if="data.movie.director" class="flex items-center gap-3">
                <p class="text-gray-200 font-body">
                  {{ data.movie.director.firstname }}
                  {{ data.movie.director.lastname }}
                </p>

              </div>
              <p v-else class="text-sm text-gray-500 italic font-body">
                Aucun réalisateur renseigné
              </p>

              <p class="text-white font-body">
                {{ data.movie.duration }} min
              </p>
            </div>
            </div>

            <div
                v-if="data.movie.actors.edges.length"
                class="flex flex-row flex-wrap gap-3 shrink-0 max-w-xs"
            >
              <div
                  v-for="actor in data.movie.actors.edges"
                  :key="actor.node.id"
                  class="bg-[#13151d] border border-[#292d3e]
           rounded-xl px-3 py-2
           hover:border-[#f43a00] transition"
              >
                <p class="text-white font-body whitespace-nowrap text-sm">
                  {{ actor.node.firstname }} {{ actor.node.lastname }}
                </p>
              </div>
            </div>

          </div>
        </div>

      </div>

    </section>

    <section v-if="data?.movie" class="container mx-auto mt-20 px-6 lg:px-12 pb-14" id="reviews">
      <div class="bg-[#1b1e29] border border-[#292d3e] rounded-2xl p-8">
        <div class="flex items-center justify-between mb-6">
          <div>
            <h2 class="text-2xl text-white font-body">
              Avis des spectateurs
            </h2>
            <div v-if="reviews.length > 0" class="flex items-center gap-3 mt-2">
              <div class="flex items-center gap-1">
                <span
                    v-for="star in 5"
                    :key="star"
                    class="text-2xl"
                    :class="star <= Math.round(parseFloat(averageRating)) ? 'text-[#f43a00]' : 'text-gray-600'"
                >
                  ★
                </span>
              </div>
              <span class="text-gray-400 font-body">
                {{ averageRating }}/5 · {{ reviews.length }} avis
              </span>
            </div>
          </div>
        </div>

        <!-- Formulaire de review -->
        <div v-if="showReviewForm && isAuthenticated" class="mb-8 p-6 bg-[#13151d] border border-[#292d3e] rounded-xl">
          <h3 class="text-lg text-white font-body mb-4">Votre avis</h3>

          <div v-if="reviewSuccess" class="mb-4 p-4 bg-green-900/20 border border-green-500 rounded-lg text-green-400">
            Merci pour votre avis!
          </div>

          <form @submit.prevent="submitReview" class="space-y-4">
            <div>
              <label class="block text-gray-300 font-body mb-2">Note</label>
              <div class="flex items-center gap-2">
                <button
                    v-for="star in 5"
                    :key="star"
                    type="button"
                    @click="setRating(star)"
                    @mouseenter="hoverRating = star"
                    @mouseleave="hoverRating = 0"
                    class="text-4xl transition hover:scale-110 focus:outline-none"
                    :class="(hoverRating >= star || reviewForm.rating >= star) ? 'text-[#f43a00]' : 'text-gray-600'"
                >
                  ★
                </button>
                <span v-if="reviewForm.rating > 0" class="ml-2 text-gray-400 font-body">
                  {{ reviewForm.rating }}/5
                </span>
              </div>
            </div>

            <div>
              <label class="block text-gray-300 font-body mb-2">Commentaire</label>
              <textarea
                  v-model="reviewForm.comment"
                  required
                  rows="4"
                  class="w-full px-4 py-3 bg-[#1b1e29] border border-[#292d3e] rounded-lg text-white placeholder-gray-500 focus:outline-none focus:border-[#f43a00]"
                  placeholder="Partagez votre avis sur ce film..."
              ></textarea>
            </div>

            <button
                type="submit"
                :disabled="submittingReview || !reviewForm.rating"
                class="w-full px-8 py-3 bg-gradient-to-r from-[#f43a00] to-[#b12f01] text-white rounded-lg font-body font-medium hover:opacity-90 transition disabled:opacity-50 hover:cursor-pointer"
            >
              {{ submittingReview ? 'Publication...' : 'Publier mon avis' }}
            </button>
          </form>
        </div>

        <div v-if="loadingReviews" class="text-gray-400 font-body">
          Chargement des avis...
        </div>

        <div v-else-if="reviews.length === 0" class="text-center py-12">
          <p class="text-gray-500 font-body">Aucun avis pour le moment. Soyez le premier à donner votre avis!</p>
        </div>

        <div v-else class="space-y-6">
          <div
              v-for="review in reviews"
              :key="review.id"
              class="p-6 bg-[#13151d] border border-[#292d3e] rounded-xl hover:border-[#f43a00]/30 transition"
          >
            <div class="flex items-start justify-between mb-3">
              <div class="flex items-center gap-3">
                <div class="w-10 h-10 rounded-full bg-gradient-to-br from-[#f43a00] to-[#b12f01] flex items-center justify-center">
                  <span class="text-white font-body font-bold">
                    {{ review.user?.email?.[0]?.toUpperCase() || 'U' }}
                  </span>
                </div>
                <div>
                  <p class="text-white font-body">
                    {{ review.user?.email || 'Utilisateur' }}
                  </p>
                </div>
              </div>

              <div class="flex items-center gap-1">
                <span
                    v-for="star in 5"
                    :key="star"
                    class="text-lg"
                    :class="star <= review.rating ? 'text-[#f43a00]' : 'text-gray-600'"
                >
                  ★
                </span>
              </div>
            </div>

            <p class="text-gray-300 font-body leading-relaxed">
              {{ review.comment }}
            </p>
          </div>
        </div>
      </div>
    </section>

  </div>
</template>

