<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { Film, Star, Users, Clapperboard, Play, ChevronDown, Sparkles, Quote } from 'lucide-vue-next'

const reviewsApi = useReviews()
const movie = ref<{ id: string; name: string; description: string } | null>(null)
const reviews = ref<any[]>([])
const loadingReviews = ref(false)
const trendingMovies = ref<any[]>([])
const isVisible = ref(false)

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

const allMoviesQuery = `
query {
  movies(first: 6) {
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
  setTimeout(() => isVisible.value = true, 100)

  // Fetch featured movie
  const { data } = await useAsyncGqlPulse<MovieQuery>({
    client: 'backendapi',
    document: query,
    variables: { name: 'Forrest Gump' }
  })

  movie.value = data.value?.movies?.edges[0]?.node ?? null

  // Fetch trending movies
  const { data: trendingData } = await useAsyncGqlPulse<MovieQuery>({
    client: 'backendapi',
    document: allMoviesQuery
  })

  trendingMovies.value = trendingData.value?.movies?.edges.map(e => e.node) || []

  if (movie.value?.id) {
    loadingReviews.value = true
    try {
      const response: any = await reviewsApi.getMovieReviews(movie.value.id)
      reviews.value = (response['member'] || response['hydra:member'] || []).slice(0, 3)
    } catch (error) {
      console.error('Erreur lors du chargement des reviews:', error)
    } finally {
      loadingReviews.value = false
    }
  }
})


const getIdFromIri = (iri: string) => iri.split('/').pop()!

const stats = [
  { icon: Film, value: '+200', label: 'Films' },
  { icon: Users, value: '+100', label: 'Acteurs' },
  { icon: Clapperboard, value: '+50', label: 'Réalisateurs' },
  { icon: Star, value: '+150', label: 'Avis' },
]

const features = [
  {
    title: 'Collection exclusive',
    description: 'Des classiques intemporels aux chefs-d\'oeuvre contemporains, explorez une sélection raffinée.',
    icon: '01'
  },
  {
    title: 'Critiques éclairées',
    description: 'Partagez votre passion et découvrez les perspectives uniques de notre communauté.',
    icon: '02'
  },
  {
    title: 'Talents d\'exception',
    description: 'Plongez dans l\'univers des artistes qui façonnent le septième art.',
    icon: '03'
  }
]
</script>

<template>
  <div class="min-h-screen bg-[#0a0a0c]">
    <section class="relative min-h-screen flex items-center justify-center overflow-hidden film-grain">
      <div
        class="absolute inset-0 opacity-40"
      >
        <div class="absolute inset-0 bg-gradient-to-br from-[#1a1a24] via-[#0a0a0c] to-[#12121a]"></div>
        <div class="absolute top-1/4 left-1/4 w-96 h-96 bg-[#d4af37]/5 rounded-full blur-3xl"></div>
        <div class="absolute bottom-1/4 right-1/4 w-80 h-80 bg-[#d4af37]/3 rounded-full blur-3xl"></div>
      </div>

      <div class="absolute inset-0 overflow-hidden pointer-events-none">
        <div class="absolute left-8 top-0 bottom-0 w-px bg-gradient-to-b from-transparent via-[#d4af37]/20 to-transparent"></div>
        <div class="absolute right-8 top-0 bottom-0 w-px bg-gradient-to-b from-transparent via-[#d4af37]/20 to-transparent"></div>
        <div class="absolute top-20 left-12 w-16 h-16 border-l border-t border-[#d4af37]/30"></div>
        <div class="absolute top-20 right-12 w-16 h-16 border-r border-t border-[#d4af37]/30"></div>
        <div class="absolute bottom-20 left-12 w-16 h-16 border-l border-b border-[#d4af37]/30"></div>
        <div class="absolute bottom-20 right-12 w-16 h-16 border-r border-b border-[#d4af37]/30"></div>
      </div>

      <div class="relative z-10 container mx-auto px-6 lg:px-12 text-center">
        <div :class="['transition-all duration-1000', isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10']">
          <div class="flex items-center justify-center gap-4 mb-8">
            <span class="h-px w-12 bg-gradient-to-r from-transparent to-[#d4af37]"></span>
            <span class="text-[#d4af37] text-sm tracking-[0.3em] uppercase font-body">Bienvenue dans</span>
            <span class="h-px w-12 bg-gradient-to-l from-transparent to-[#d4af37]"></span>
          </div>

          <h1 class="font-display text-6xl md:text-7xl lg:text-8xl xl:text-9xl text-white mb-6 tracking-tight">
            L'Univers du
            <span class="block text-gold-gradient italic">Cinéma</span>
          </h1>

          <p class="font-accent text-xl md:text-2xl text-[#c0c0c0] max-w-2xl mx-auto mb-12 leading-relaxed italic">
            Une expérience immersive au coeur du septième art,
            <br class="hidden md:block" />
            où chaque film raconte une histoire unique.
          </p>

          <div class="flex flex-col sm:flex-row items-center justify-center gap-4 mb-16">
            <NuxtLink
              to="/movies"
              class="group relative px-6 py-4 rounded-xs bg-gradient-to-r from-[#d4af37] to-[#a68a2a] text-[#0a0a0c] font-body font-semibold rounded-none overflow-hidden transition-all duration-300 hover:brightness-110"
            >
              <span class="relative z-10 flex items-center gap-3">
                Explorer les films
                <Play class="w-4 h-4 transition-transform group-hover:translate-x-1" />
              </span>
              <div class="absolute inset-0 bg-gradient-to-r from-[#f4e4a6] to-[#d4af37] opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
            </NuxtLink>

            <NuxtLink
              to="/acteurs"
              class="group px-6 py-4 rounded-xs border border-[#d4af37]/40 text-[#d4af37] font-body font-medium rounded-none transition-all duration-300 hover:bg-[#d4af37]/10 hover:border-[#d4af37]"
            >
              <span class="flex items-center gap-3">
                Découvrir les acteurs
                <Sparkles class="w-4 h-4" />
              </span>
            </NuxtLink>
          </div>

          <div class="grid grid-cols-2 md:grid-cols-4 gap-8 max-w-4xl mx-auto">
            <div
              v-for="(stat, index) in stats"
              :key="stat.label"
              :class="[
                'text-center transition-all duration-700',
                isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10'
              ]"
              :style="{ transitionDelay: `${(index + 3) * 150}ms` }"
            >
              <component :is="stat.icon" class="w-6 h-6 text-[#d4af37] mx-auto mb-3" />
              <div class="text-3xl md:text-4xl font-display text-white mb-1">{{ stat.value }}</div>
              <div class="text-sm text-[#c0c0c0] tracking-wider uppercase font-body">{{ stat.label }}</div>
            </div>
          </div>
        </div>

        <div class="absolute bottom-12 left-1/2 -translate-x-1/2 scroll-indicator">
          <ChevronDown class="w-6 h-6 text-[#d4af37]/60" />
        </div>
      </div>
    </section>

    <section class="relative py-32 bg-[#0a0a0c]">
      <div class="container mx-auto px-6 lg:px-12">
        <div class="max-w-3xl mx-auto text-center mb-20">
          <span class="text-[#d4af37] text-sm tracking-[0.3em] uppercase font-body mb-4 block">Expérience Unique</span>
          <h2 class="font-display text-4xl md:text-5xl lg:text-6xl text-white mb-6">
            Pourquoi <span class="italic text-gold-gradient">Moview</span> ?
          </h2>
          <p class="font-body text-[#c0c0c0] text-lg leading-relaxed">
            Une plateforme pensée pour les passionnés, du simple spectateur au cinéphile averti.
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 lg:gap-12">
          <div
            v-for="(feature, index) in features"
            :key="feature.title"
            class="group relative p-8 lg:p-10 bg-gradient-to-b from-[#12121a] to-[#0a0a0c] border border-[#d4af37]/10 hover:border-[#d4af37]/30 transition-all duration-500"
          >
            <div class="absolute -top-4 -left-4 w-12 h-12 flex items-center justify-center">
              <span class="font-display text-5xl text-[#d4af37]/10 group-hover:text-[#d4af37]/20 transition-colors duration-500">
                {{ feature.icon }}
              </span>
            </div>

            <div class="absolute inset-0 bg-gradient-to-b from-[#d4af37]/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>

            <div class="relative z-10">
              <h3 class="font-display text-2xl text-white mb-4 group-hover:text-[#f4e4a6] transition-colors duration-300">
                {{ feature.title }}
              </h3>
              <p class="font-body text-[#c0c0c0] leading-relaxed">
                {{ feature.description }}
              </p>

              <div class="mt-6 h-px w-0 bg-gradient-to-r from-[#d4af37] to-transparent group-hover:w-full transition-all duration-500"></div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section v-if="movie" class="relative min-h-screen overflow-hidden">
      <div
        class="absolute inset-0 bg-cover bg-center"
        style="background-image: url('/images/oblivion.jpg')"
      ></div>

      <div class="absolute inset-0 bg-gradient-to-t from-[#0a0a0c] via-[#0a0a0c]/60 to-[#0a0a0c]/30"></div>
      <div class="absolute inset-0 bg-gradient-to-r from-[#0a0a0c]/80 via-transparent to-[#0a0a0c]/40"></div>
      <div class="absolute inset-0 vignette"></div>
      <div class="absolute inset-0 film-grain"></div>
      <div class="relative z-10 container mx-auto px-6 lg:px-12 min-h-screen flex items-end pb-24">
        <div class="max-w-3xl">
          <div class="flex items-center gap-4 mb-6">
            <span class="px-4 py-2 rounded-xs bg-[#d4af37] text-[#0a0a0c] text-xs font-body font-semibold tracking-wider uppercase">
              Film à l'affiche
            </span>
            <span class="h-px flex-1 max-w-24 bg-[#d4af37]/40"></span>
          </div>

          <h2 class="font-display text-5xl md:text-6xl lg:text-7xl text-white mb-6 leading-tight">
            {{ movie.name }}
          </h2>

          <p class="font-body text-lg md:text-xl text-[#c0c0c0] mb-10 leading-relaxed max-w-2xl">
            {{ movie.description }}
          </p>

          <NuxtLink
            :to="`/movies/${getIdFromIri(movie.id)}`"
            class="group inline-flex items-center gap-4 px-3 py-3 rounded-xs bg-white/10 backdrop-blur-sm border border-white/20 text-white font-body font-medium hover:bg-[#d4af37] hover:border-[#d4af37] hover:text-[#0a0a0c] transition-all duration-300"
          >
            <Play class="w-5 h-5" />
            Voir les Détails
            <span class="w-8 h-px bg-current transition-all duration-300 group-hover:w-12"></span>
          </NuxtLink>
        </div>
      </div>

      <div class="absolute bottom-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[#d4af37]/30 to-transparent"></div>
    </section>

    <section v-else class="min-h-[50vh] flex items-center justify-center bg-[#0a0a0c]">
      <div class="text-center">
        <div class="w-12 h-12 border-2 border-[#d4af37]/20 border-t-[#d4af37] rounded-full animate-spin mx-auto mb-4"></div>
        <p class="text-[#c0c0c0] font-body">Chargement...</p>
      </div>
    </section>

    <section class="relative py-32 bg-[#0a0a0c]">
      <div class="absolute inset-0 overflow-hidden pointer-events-none">
        <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[800px] h-[800px] bg-[#d4af37]/3 rounded-full blur-3xl"></div>
      </div>

      <div class="relative z-10 container mx-auto px-6 lg:px-12">
        <div class="text-center mb-16">
          <span class="text-[#d4af37] text-sm tracking-[0.3em] uppercase font-body mb-4 block">Témoignages</span>
          <h2 class="font-display text-4xl md:text-5xl text-white mb-4">
            Avis sur <span class="italic text-gold-gradient">{{ movie?.name || 'Forrest Gump' }}</span>
          </h2>
          <div class="flex items-center justify-center gap-4 mt-6">
            <span class="h-px w-16 bg-gradient-to-r from-transparent to-[#d4af37]/40"></span>
            <Quote class="w-6 h-6 text-[#d4af37]/40" />
            <span class="h-px w-16 bg-gradient-to-l from-transparent to-[#d4af37]/40"></span>
          </div>
        </div>

        <div v-if="loadingReviews" class="text-center">
          <div class="w-8 h-8 border-2 border-[#d4af37]/20 border-t-[#d4af37] rounded-full animate-spin mx-auto"></div>
        </div>

        <div v-else-if="reviews.length === 0" class="text-center text-[#c0c0c0] font-body py-12">
          <p>Aucun avis disponible pour ce film.</p>
        </div>

        <div v-else class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div
            v-for="(review, index) in reviews"
            :key="review.id"
            class="group relative p-8 bg-gradient-to-b from-[#12121a] to-[#0a0a0c] border border-[#d4af37]/10 hover:border-[#d4af37]/30 transition-all duration-500"
          >
            <div class="absolute top-6 right-6 opacity-10 group-hover:opacity-20 transition-opacity duration-300">
              <Quote class="w-12 h-12 text-[#d4af37]" />
            </div>

            <div class="flex items-center gap-1 mb-6">
              <Star
                v-for="star in 5"
                :key="star"
                class="w-5 h-5 transition-colors duration-300"
                :class="star <= review.rating ? 'text-[#d4af37] fill-[#d4af37]' : 'text-[#d4af37]/20'"
              />
            </div>

            <p class="font-body text-[#c0c0c0] leading-relaxed mb-6 line-clamp-4">
              "{{ review.comment }}"
            </p>

            <div class="flex items-center gap-4 pt-6 border-t border-[#d4af37]/10">
              <div class="w-12 h-12 rounded-full bg-gradient-to-br from-[#d4af37] to-[#a68a2a] flex items-center justify-center">
                <span class="text-[#0a0a0c] font-display font-bold text-lg">
                  {{ review.user?.email?.[0]?.toUpperCase() || 'U' }}
                </span>
              </div>
              <div>
                <div class="font-body font-medium text-white">
                  {{ review.user?.email?.split('@')[0] || 'Utilisateur' }}
                </div>
                <div class="font-body text-sm text-[#c0c0c0]">Cinéphile vérifié</div>
              </div>
            </div>
          </div>
        </div>

        <div v-if="movie" class="text-center mt-12">
          <NuxtLink
            :to="`/movies/${getIdFromIri(movie.id)}`"
            class="inline-flex items-center gap-3 text-[#d4af37] font-body hover:text-[#f4e4a6] transition-colors duration-300 animated-underline"
          >
            Voir tous les avis
            <span class="w-6 h-px bg-current"></span>
          </NuxtLink>
        </div>
      </div>
    </section>

    <section v-if="trendingMovies.length > 0" class="relative py-32 bg-[#12121a]">
      <div class="container mx-auto px-6 lg:px-12">
        <div class="flex items-center justify-between mb-12">
          <div>
            <span class="text-[#d4af37] text-sm tracking-[0.3em] uppercase font-body mb-2 block">Découvrir</span>
            <h2 class="font-display text-4xl md:text-5xl text-white">
              Les films <span class="italic text-gold-gradient">tendance</span>
            </h2>
          </div>
          <NuxtLink
            to="/movies"
            class="hidden md:flex items-center gap-3 text-[#d4af37] font-body hover:text-[#f4e4a6] transition-colors duration-300"
          >
            Voir tout
            <span class="w-8 h-px bg-current"></span>
          </NuxtLink>
        </div>

        <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-4">
          <NuxtLink
            v-for="(trendingMovie, index) in trendingMovies"
            :key="trendingMovie.id"
            :to="`/movies/${getIdFromIri(trendingMovie.id)}`"
            class="group relative aspect-[2/3] bg-[#1a1a24] overflow-hidden"
          >
            <div class="absolute inset-0 bg-gradient-to-br from-[#1a1a24] to-[#0a0a0c]"></div>
            <div class="absolute inset-0 bg-gradient-to-t from-[#0a0a0c] via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
            <div class="absolute inset-0 border border-[#d4af37]/0 group-hover:border-[#d4af37]/40 transition-all duration-300"></div>
            <div class="absolute inset-0 flex flex-col justify-end p-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
              <h3 class="font-display text-lg text-white line-clamp-2">{{ trendingMovie.name }}</h3>
            </div>
            <div class="absolute top-3 left-3 w-8 h-8 bg-[#d4af37] flex items-center justify-center">
              <span class="font-display font-bold text-[#0a0a0c]">{{ index + 1 }}</span>
            </div>
          </NuxtLink>
        </div>
        <div class="md:hidden text-center mt-8">
          <NuxtLink
            to="/movies"
            class="inline-flex items-center gap-3 text-[#d4af37] font-body"
          >
            Voir tous les films
            <span class="w-6 h-px bg-current"></span>
          </NuxtLink>
        </div>
      </div>
    </section>

    <section class="relative py-32 bg-[#0a0a0c] overflow-hidden">
      <div class="absolute inset-0">
        <div class="absolute top-0 left-1/4 w-px h-full bg-gradient-to-b from-[#d4af37]/20 via-transparent to-[#d4af37]/20"></div>
        <div class="absolute top-0 right-1/4 w-px h-full bg-gradient-to-b from-[#d4af37]/20 via-transparent to-[#d4af37]/20"></div>
      </div>

      <div class="relative z-10 container mx-auto px-6 lg:px-12 text-center">
        <div class="max-w-3xl mx-auto">
          <h2 class="font-display text-4xl md:text-5xl lg:text-6xl text-white mb-6">
            Prêt à plonger dans
            <span class="block italic text-gold-gradient">l'Univers du cinéma ?</span>
          </h2>
          <p class="font-body text-[#c0c0c0] text-lg mb-10">
            Rejoignez notre communauté de passionnés et partagez votre amour du septième art.
          </p>
          <NuxtLink
            to="/register"
            class="inline-flex items-center gap-3 px-4 py-3 rounded-xs bg-gradient-to-r from-[#d4af37] to-[#a68a2a] text-[#0a0a0c] font-body font-semibold hover:brightness-110 transition-all duration-300"
          >
            Créer un compte
          </NuxtLink>
        </div>
      </div>
    </section>
  </div>
</template>

<style scoped>
.line-clamp-4 {
  display: -webkit-box;
  -webkit-line-clamp: 4;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>
