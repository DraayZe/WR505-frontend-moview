<script setup lang="ts">
import { Star, Play, Clock, User, Film, ArrowLeft, MessageSquare, Send } from 'lucide-vue-next'

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
    duration: number

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
const loadingReviews = ref(false)
const showReviewForm = ref(false)

const reviewForm = ref({
  rating: 0,
  comment: '',
})

const hoverRating = ref(0)
const submittingReview = ref(false)
const reviewSuccess = ref(false)

const loadReviews = async (movieIri?: string) => {
  loadingReviews.value = true
  try {
    const response: any = await reviewsApi.getMovieReviews(movieIri || data.value?.movie?.id)
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
  <div class="min-h-screen bg-[#0a0a0c]">
    <section v-if="data?.movie" class="relative min-h-screen overflow-hidden">
      <div
        class="absolute inset-0 bg-cover bg-center"
        style="background-image: url('/images/oblivion.jpg');"
      ></div>
      <div class="absolute inset-0 bg-gradient-to-t from-[#0a0a0c] via-[#0a0a0c]/70 to-[#0a0a0c]/30"></div>
      <div class="absolute inset-0 bg-gradient-to-r from-[#0a0a0c]/90 via-[#0a0a0c]/50 to-transparent"></div>
      <div class="absolute inset-0 vignette"></div>
      <div class="absolute inset-0 film-grain"></div>
      <div class="relative z-10 container mx-auto px-6 lg:px-12 min-h-screen flex flex-col">
        <div class="pt-28">
          <NuxtLink
            to="/movies"
            class="inline-flex items-center gap-2 text-[#c0c0c0] hover:text-[#d4af37] transition-colors duration-300 font-body"
          >
            <ArrowLeft class="w-5 h-5" />
            Retour au catalogue
          </NuxtLink>
        </div>

        <div class="flex-1 flex items-end pb-20">
          <div class="grid grid-cols-1 lg:grid-cols-3 gap-12 w-full">
            <div class="lg:col-span-2">
              <div class="flex flex-wrap gap-3 mb-6">
                <span
                  v-for="cat in data.movie.categories.edges"
                  :key="cat.node.id"
                  class="text-xs font-body px-3 py-2 rounded-xs bg-[#d4af37]/20 text-[#d4af37] border border-[#d4af37]/30"
                >
                  {{ cat.node.name }}
                </span>
              </div>
              <h1 class="font-display text-5xl lg:text-7xl text-white mb-6 leading-tight">
                {{ data.movie.name }}
              </h1>

              <div class="flex flex-wrap items-center gap-6 mb-8">
                <div v-if="reviews.length > 0" class="flex items-center gap-2">
                  <div class="flex items-center gap-1">
                    <Star
                      v-for="star in 5"
                      :key="star"
                      class="w-5 h-5"
                      :class="star <= Math.round(parseFloat(averageRating)) ? 'text-[#d4af37] fill-[#d4af37]' : 'text-[#d4af37]/30'"
                    />
                  </div>
                  <span class="font-body text-white">{{ averageRating }}</span>
                  <span class="font-body text-[#c0c0c0]">({{ reviews.length }} avis)</span>
                </div>

                <div v-if="data.movie.duration" class="flex items-center gap-2 text-[#c0c0c0]">
                  <Clock class="w-5 h-5 text-[#d4af37]" />
                  <span class="font-body">{{ data.movie.duration }} min</span>
                </div>

                <div v-if="data.movie.director" class="flex items-center gap-2 text-[#c0c0c0]">
                  <User class="w-5 h-5 text-[#d4af37]" />
                  <span class="font-body">{{ data.movie.director.firstname }} {{ data.movie.director.lastname }}</span>
                </div>
              </div>

              <p class="font-body text-lg text-[#c0c0c0] leading-relaxed max-w-2xl mb-10">
                {{ data.movie.description || 'Aucune description disponible.' }}
              </p>

              <div class="flex flex-wrap gap-4">
                <button
                  v-if="isAuthenticated"
                  @click="showReviewForm = true; scrollToReviews()"
                  class="hover:cursor-pointer group px-6 py-4 bg-gradient-to-r from-[#d4af37] to-[#a68a2a] text-[#0a0a0c] font-body font-semibold flex items-center gap-3 hover:brightness-110 transition-all duration-300"
                >
                  <MessageSquare class="w-5 h-5" />
                  Donner un avis
                </button>
                <NuxtLink
                  v-else
                  to="/login"
                  class="group px-8 py-4 bg-gradient-to-r from-[#d4af37] to-[#a68a2a] text-[#0a0a0c] font-body font-semibold flex items-center gap-3 hover:brightness-110 transition-all duration-300"
                >
                  <MessageSquare class="w-5 h-5" />
                  Connectez-vous pour donner un avis
                </NuxtLink>

                <NuxtLink
                  to="/movies"
                  class="px-6 py-4 border border-[#d4af37]/40 text-[#d4af37] font-body font-medium hover:bg-[#d4af37]/10 hover:border-[#d4af37] transition-all duration-300 flex items-center gap-3"
                >
                  <Film class="w-5 h-5" />
                  Voir d'autres films
                </NuxtLink>
              </div>
            </div>

            <div v-if="data.movie.actors.edges.length" class="lg:border-l lg:border-[#d4af37]/20 lg:pl-12">
              <h3 class="font-display text-xl text-white mb-6">Distribution</h3>
              <div class="space-y-4">
                <div
                  v-for="actor in data.movie.actors.edges.slice(0, 6)"
                  :key="actor.node.id"
                  class="flex items-center gap-4 group"
                >
                  <div>
                    <p class="font-body text-white group-hover:text-[#d4af37] transition-colors duration-300">
                      {{ actor.node.firstname }} {{ actor.node.lastname }}
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="absolute bottom-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[#d4af37]/30 to-transparent"></div>
    </section>

    <section v-if="data?.movie" id="reviews" class="py-20 bg-[#0a0a0c]">
      <div class="container mx-auto px-6 lg:px-12">
        <div class="flex items-center justify-between mb-12">
          <div>
            <span class="text-[#d4af37] text-sm tracking-[0.3em] uppercase font-body mb-2 block">Témoignages</span>
            <h2 class="font-display text-3xl lg:text-4xl text-white">
              Avis des <span class="italic text-gold-gradient">spectateurs</span>
            </h2>
          </div>
          <div v-if="reviews.length > 0" class="hidden md:flex items-center gap-3">
            <div class="flex items-center gap-1">
              <Star
                v-for="star in 5"
                :key="star"
                class="w-6 h-6"
                :class="star <= Math.round(parseFloat(averageRating)) ? 'text-[#d4af37] fill-[#d4af37]' : 'text-[#d4af37]/20'"
              />
            </div>
            <span class="font-display text-2xl text-white">{{ averageRating }}</span>
            <span class="font-body text-[#c0c0c0]">/ 5</span>
          </div>
        </div>

        <!-- Review Form -->
        <div
          v-if="showReviewForm && isAuthenticated"
          class="mb-12 p-8 bg-[#12121a] border border-[#d4af37]/20"
        >
          <h3 class="font-display text-xl text-white mb-6">Votre avis</h3>

          <div v-if="reviewSuccess" class="mb-6 p-4 bg-[#d4af37]/10 border border-[#d4af37]/30 text-[#d4af37] font-body">
            Merci pour votre avis !
          </div>

          <form @submit.prevent="submitReview" class="space-y-6">
            <!-- Rating -->
            <div>
              <label class="block text-[#c0c0c0] font-body mb-4">Note</label>
              <div class="flex items-center gap-3">
                <button
                  v-for="star in 5"
                  :key="star"
                  type="button"
                  @click="setRating(star)"
                  @mouseenter="hoverRating = star"
                  @mouseleave="hoverRating = 0"
                  class="transition-transform hover:scale-110 focus:outline-none"
                >
                  <Star
                    class="w-10 h-10 transition-colors duration-200"
                    :class="(hoverRating >= star || reviewForm.rating >= star) ? 'text-[#d4af37] fill-[#d4af37]' : 'text-[#d4af37]/30'"
                  />
                </button>
                <span v-if="reviewForm.rating > 0" class="ml-4 text-[#c0c0c0] font-body">
                  {{ reviewForm.rating }}/5
                </span>
              </div>
            </div>

            <!-- Comment -->
            <div>
              <label class="block text-[#c0c0c0] font-body mb-4">Commentaire</label>
              <textarea
                v-model="reviewForm.comment"
                required
                rows="4"
                class="w-full px-5 py-4 bg-[#0a0a0c] border border-[#d4af37]/20 text-white placeholder-[#c0c0c0]/40 font-body focus:outline-none focus:border-[#d4af37] transition-colors duration-300 resize-none"
                placeholder="Partagez votre avis sur ce film..."
              ></textarea>
            </div>

            <!-- Submit -->
            <button
              type="submit"
              :disabled="submittingReview || !reviewForm.rating"
              class="px-8 py-4 bg-gradient-to-r from-[#d4af37] to-[#a68a2a] text-[#0a0a0c] font-body font-semibold flex items-center gap-3 hover:brightness-110 transition-all duration-300 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              <Send class="w-5 h-5" />
              {{ submittingReview ? 'Publication...' : 'Publier mon avis' }}
            </button>
          </form>
        </div>

        <!-- Reviews list -->
        <div v-if="loadingReviews" class="text-center py-12">
          <div class="w-12 h-12 border-2 border-[#d4af37]/20 border-t-[#d4af37] rounded-full animate-spin mx-auto"></div>
        </div>

        <div v-else-if="reviews.length === 0" class="text-center py-16 border border-[#d4af37]/10 bg-[#12121a]">
          <MessageSquare class="w-12 h-12 text-[#d4af37]/20 mx-auto mb-4" />
          <p class="font-body text-[#c0c0c0]">Aucun avis pour le moment. Soyez le premier à donner votre avis !</p>
        </div>

        <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <div
            v-for="review in reviews"
            :key="review.id"
            class="group p-6 bg-[#12121a] border border-[#d4af37]/10 hover:border-[#d4af37]/30 transition-all duration-300"
          >
            <!-- Header -->
            <div class="flex items-start justify-between mb-4">
              <div class="flex items-center gap-3">
                <div class="w-12 h-12 rounded-full bg-gradient-to-br from-[#d4af37] to-[#a68a2a] flex items-center justify-center">
                  <span class="text-[#0a0a0c] font-display font-bold">
                    {{ review.user?.email?.[0]?.toUpperCase() || 'U' }}
                  </span>
                </div>
                <div>
                  <p class="font-body text-white">
                    {{ review.user?.email?.split('@')[0] || 'Utilisateur' }}
                  </p>
                  <p class="font-body text-xs text-[#c0c0c0]">Cinéphile vérifié</p>
                </div>
              </div>

              <!-- Rating -->
              <div class="flex items-center gap-1">
                <Star
                  v-for="star in 5"
                  :key="star"
                  class="w-4 h-4"
                  :class="star <= review.rating ? 'text-[#d4af37] fill-[#d4af37]' : 'text-[#d4af37]/20'"
                />
              </div>
            </div>

            <!-- Comment -->
            <p class="font-body text-[#c0c0c0] leading-relaxed">
              "{{ review.comment }}"
            </p>

            <!-- Decorative line -->
            <div class="mt-6 h-px w-0 bg-gradient-to-r from-[#d4af37] to-transparent group-hover:w-full transition-all duration-500"></div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>
