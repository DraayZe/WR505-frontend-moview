<script setup lang="ts">
definePageMeta({
  middleware: 'admin'
})

const activeTab = ref('stats')
const admin = useAdmin()

// Chargement des stats
const stats = ref<any>(null)
const loadingStats = ref(false)

const loadStats = async () => {
  loadingStats.value = true
  try {
    stats.value = await admin.getStats()
  } catch (error) {
    console.error('Erreur lors du chargement des stats:', error)
  } finally {
    loadingStats.value = false
  }
}

// Formulaire Film
const movieForm = ref({
  name: '',
  description: '',
  releaseData: '',
  duration: 0,
})

const submittingMovie = ref(false)
const movieSuccess = ref(false)

const submitMovie = async () => {
  submittingMovie.value = true
  movieSuccess.value = false
  try {
    await admin.createMovie(movieForm.value)
    movieSuccess.value = true
    movieForm.value = {
      name: '',
      description: '',
      releaseData: '',
      duration: 0,
    }
    await loadStats()
  } catch (error) {
    console.error('Erreur:', error)
  } finally {
    submittingMovie.value = false
  }
}

const actorForm = ref({
  firstname: '',
  lastname: '',
  dob: '',
  dod: '',
  bio: '',
})

const submittingActor = ref(false)
const actorSuccess = ref(false)

const submitActor = async () => {
  submittingActor.value = true
  actorSuccess.value = false
  try {
    await admin.createActor(actorForm.value)
    actorSuccess.value = true
    actorForm.value = {
      firstname: '',
      lastname: '',
      dob: '',
      dod: '',
      bio: '',
    }
    await loadStats()
  } catch (error) {
    console.error('Erreur:', error)
  } finally {
    submittingActor.value = false
  }
}

// Formulaire Réalisateur
const directorForm = ref({
  firstName: '',
  lastName: '',
  birthDate: '',
  nationality: '',
})

const submittingDirector = ref(false)
const directorSuccess = ref(false)

const submitDirector = async () => {
  submittingDirector.value = true
  directorSuccess.value = false
  try {
    await admin.createDirector(directorForm.value)
    directorSuccess.value = true
    directorForm.value = {
      firstName: '',
      lastName: '',
      birthDate: '',
      nationality: '',
    }
    await loadStats()
  } catch (error) {
    console.error('Erreur:', error)
  } finally {
    submittingDirector.value = false
  }
}

onMounted(() => {
  loadStats()
})
</script>

<template>
  <div class="min-h-screen bg-[#13151d]">
    <section class="bg-gradient-to-br from-[#1b1e29] via-[#252837] to-[#1b1e29] border-b border-[#292d3e]">
      <div class="container mx-auto px-6 lg:px-12 py-20">
        <h1 class="text-5xl text-white font-body mb-4">
          Administration
        </h1>
        <p class="text-gray-400 text-lg font-body">
          Gérez les films, acteurs et réalisateurs de la plateforme
        </p>
      </div>
    </section>

    <section class="border-b border-[#292d3e]">
      <div class="container mx-auto px-6 lg:px-12">
        <div class="flex gap-8 overflow-x-auto">
          <button
              @click="activeTab = 'stats'"
              :class="[
                'py-4 px-2 font-body font-medium border-b-2 transition whitespace-nowrap hover:cursor-pointer',
                activeTab === 'stats'
                  ? 'text-[#f43a00] border-[#f43a00]'
                  : 'text-gray-400 border-transparent hover:text-white'
              ]"
          >
            Statistiques
          </button>
          <button
              @click="activeTab = 'movies'"
              :class="[
                'py-4 px-2 font-body font-medium border-b-2 transition whitespace-nowrap hover:cursor-pointer',
                activeTab === 'movies'
                  ? 'text-[#f43a00] border-[#f43a00]'
                  : 'text-gray-400 border-transparent hover:text-white'
              ]"
          >
            Créer un film
          </button>
          <button
              @click="activeTab = 'actors'"
              :class="[
                'py-4 px-2 font-body font-medium border-b-2 transition whitespace-nowrap hover:cursor-pointer',
                activeTab === 'actors'
                  ? 'text-[#f43a00] border-[#f43a00]'
                  : 'text-gray-400 border-transparent hover:text-white'
              ]"
          >
            Créer un acteur
          </button>
          <button
              @click="activeTab = 'directors'"
              :class="[
                'py-4 px-2 font-body font-medium border-b-2 transition whitespace-nowrap hover:cursor-pointer',
                activeTab === 'directors'
                  ? 'text-[#f43a00] border-[#f43a00]'
                  : 'text-gray-400 border-transparent hover:text-white'
              ]"
          >
            Créer un réalisateur
          </button>
        </div>
      </div>
    </section>

    <section class="py-16">
      <div class="container mx-auto px-6 lg:px-12">
        <!-- Stats -->
        <div v-if="activeTab === 'stats'" class="max-w-4xl">
          <h2 class="text-3xl text-white font-body mb-8">Statistiques globales</h2>

          <div v-if="loadingStats" class="text-gray-400">
            Chargement des statistiques...
          </div>

          <div v-else-if="stats" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            <div class="bg-[#1b1e29] border border-[#292d3e] rounded-xl p-8 hover:border-[#f43a00] transition">
              <div class="text-[#f43a00] text-4xl font-bold mb-2">
                {{ stats.movies?.totalCount || 0 }}
              </div>
              <div class="text-gray-400 font-body">Films</div>
            </div>

            <div class="bg-[#1b1e29] border border-[#292d3e] rounded-xl p-8 hover:border-[#f43a00] transition">
              <div class="text-[#f43a00] text-4xl font-bold mb-2">
                {{ stats.actors?.totalCount || 0 }}
              </div>
              <div class="text-gray-400 font-body">Acteurs</div>
            </div>

            <div class="bg-[#1b1e29] border border-[#292d3e] rounded-xl p-8 hover:border-[#f43a00] transition">
              <div class="text-[#f43a00] text-4xl font-bold mb-2">
                {{ stats.directors?.totalCount || 0 }}
              </div>
              <div class="text-gray-400 font-body">Réalisateurs</div>
            </div>

            <div class="bg-[#1b1e29] border border-[#292d3e] rounded-xl p-8 hover:border-[#f43a00] transition">
              <div class="text-[#f43a00] text-4xl font-bold mb-2">
                {{ stats.categories?.totalCount || 0 }}
              </div>
              <div class="text-gray-400 font-body">Catégories</div>
            </div>
          </div>
        </div>

        <!-- Créer un film -->
        <div v-if="activeTab === 'movies'" class="max-w-2xl">
          <h2 class="text-3xl text-white font-body mb-8">Créer un film</h2>

          <div v-if="movieSuccess" class="mb-6 p-4 bg-green-900/20 border border-green-500 rounded-lg text-green-400">
            Film créé avec succès!
          </div>

          <form @submit.prevent="submitMovie" class="space-y-6">
            <div>
              <label class="block text-gray-300 font-body mb-2">Titre du film</label>
              <input
                  v-model="movieForm.name"
                  type="text"
                  required
                  class="w-full px-4 py-3 bg-[#1b1e29] border border-[#292d3e] rounded-lg text-white placeholder-gray-500 focus:outline-none focus:border-[#f43a00]"
                  placeholder="Ex: Pulp Fiction"
              />
            </div>

            <div>
              <label class="block text-gray-300 font-body mb-2">Description</label>
              <textarea
                  v-model="movieForm.description"
                  required
                  rows="4"
                  class="w-full px-4 py-3 bg-[#1b1e29] border border-[#292d3e] rounded-lg text-white placeholder-gray-500 focus:outline-none focus:border-[#f43a00]"
                  placeholder="Description du film..."
              ></textarea>
            </div>

            <div class="grid grid-cols-2 gap-6">
              <div>
                <label class="block text-gray-300 font-body mb-2">Date de sortie</label>
                <input
                    v-model="movieForm.releaseData"
                    type="date"
                    required
                    class="w-full px-4 py-3 bg-[#1b1e29] border border-[#292d3e] rounded-lg text-white focus:outline-none focus:border-[#f43a00]"
                />
              </div>

              <div>
                <label class="block text-gray-300 font-body mb-2">Durée (minutes)</label>
                <input
                    v-model.number="movieForm.duration"
                    type="number"
                    required
                    min="1"
                    class="w-full px-4 py-3 bg-[#1b1e29] border border-[#292d3e] rounded-lg text-white focus:outline-none focus:border-[#f43a00]"
                    placeholder="120"
                />
              </div>
            </div>

            <button
                type="submit"
                :disabled="submittingMovie"
                class="w-full px-8 py-4 bg-gradient-to-r from-[#f43a00] to-[#b12f01] text-white rounded-lg font-body font-medium hover:opacity-90 transition disabled:opacity-50"
            >
              {{ submittingMovie ? 'Création...' : 'Créer le film' }}
            </button>
          </form>
        </div>

        <div v-if="activeTab === 'actors'" class="max-w-2xl">
          <h2 class="text-3xl text-white font-body mb-8">Créer un acteur</h2>

          <div v-if="actorSuccess" class="mb-6 p-4 bg-green-900/20 border border-green-500 rounded-lg text-green-400">
            Acteur créé avec succès!
          </div>

          <form @submit.prevent="submitActor" class="space-y-6">
            <div class="grid grid-cols-2 gap-6">
              <div>
                <label class="block text-gray-300 font-body mb-2">Prénom</label>
                <input
                    v-model="actorForm.firstname"
                    type="text"
                    required
                    class="w-full px-4 py-3 bg-[#1b1e29] border border-[#292d3e] rounded-lg text-white placeholder-gray-500 focus:outline-none focus:border-[#f43a00]"
                    placeholder="John"
                />
              </div>

              <div>
                <label class="block text-gray-300 font-body mb-2">Nom</label>
                <input
                    v-model="actorForm.lastname"
                    type="text"
                    required
                    class="w-full px-4 py-3 bg-[#1b1e29] border border-[#292d3e] rounded-lg text-white placeholder-gray-500 focus:outline-none focus:border-[#f43a00]"
                    placeholder="Travolta"
                />
              </div>
            </div>

            <div class="grid grid-cols-2 gap-6">
              <div>
                <label class="block text-gray-300 font-body mb-2">Date de naissance</label>
                <input
                    v-model="actorForm.dob"
                    type="date"
                    class="w-full px-4 py-3 bg-[#1b1e29] border border-[#292d3e] rounded-lg text-white focus:outline-none focus:border-[#f43a00]"
                />
              </div>
              <div>
                <label class="block text-gray-300 font-body mb-2">Date de décès</label>
                <input
                    v-model="actorForm.dod"
                    type="date"
                    class="w-full px-4 py-3 bg-[#1b1e29] border border-[#292d3e] rounded-lg text-white focus:outline-none focus:border-[#f43a00]"
                />
              </div>


              <div>
                <label class="block text-gray-300 font-body mb-2">Biographie</label>
                <input
                    v-model="actorForm.bio"
                    type="text"
                    class="w-full px-4 py-3 bg-[#1b1e29] border border-[#292d3e] rounded-lg text-white placeholder-gray-500 focus:outline-none focus:border-[#f43a00]"
                    placeholder="Biographie de l'acteur..."
                />
              </div>
            </div>

            <button
                type="submit"
                :disabled="submittingActor"
                class="hover:cursor-pointer w-full px-8 py-4 bg-gradient-to-r from-[#f43a00] to-[#b12f01] text-white rounded-lg font-body font-medium hover:opacity-90 transition disabled:opacity-50"
            >
              {{ submittingActor ? 'Création...' : 'Créer l\'acteur' }}
            </button>
          </form>
        </div>

        <!-- Créer un réalisateur -->
        <div v-if="activeTab === 'directors'" class="max-w-2xl">
          <h2 class="text-3xl text-white font-body mb-8">Créer un réalisateur</h2>

          <div v-if="directorSuccess" class="mb-6 p-4 bg-green-900/20 border border-green-500 rounded-lg text-green-400">
            Réalisateur créé avec succès!
          </div>

          <form @submit.prevent="submitDirector" class="space-y-6">
            <div class="grid grid-cols-2 gap-6">
              <div>
                <label class="block text-gray-300 font-body mb-2">Prénom</label>
                <input
                    v-model="directorForm.firstName"
                    type="text"
                    required
                    class="w-full px-4 py-3 bg-[#1b1e29] border border-[#292d3e] rounded-lg text-white placeholder-gray-500 focus:outline-none focus:border-[#f43a00]"
                    placeholder="Quentin"
                />
              </div>

              <div>
                <label class="block text-gray-300 font-body mb-2">Nom</label>
                <input
                    v-model="directorForm.lastName"
                    type="text"
                    required
                    class="w-full px-4 py-3 bg-[#1b1e29] border border-[#292d3e] rounded-lg text-white placeholder-gray-500 focus:outline-none focus:border-[#f43a00]"
                    placeholder="Tarantino"
                />
              </div>
            </div>

            <div class="grid grid-cols-2 gap-6">
              <div>
                <label class="block text-gray-300 font-body mb-2">Date de naissance</label>
                <input
                    v-model="directorForm.birthDate"
                    type="date"
                    class="w-full px-4 py-3 bg-[#1b1e29] border border-[#292d3e] rounded-lg text-white focus:outline-none focus:border-[#f43a00]"
                />
              </div>

              <div>
                <label class="block text-gray-300 font-body mb-2">Nationalité</label>
                <input
                    v-model="directorForm.nationality"
                    type="text"
                    class="w-full px-4 py-3 bg-[#1b1e29] border border-[#292d3e] rounded-lg text-white placeholder-gray-500 focus:outline-none focus:border-[#f43a00]"
                    placeholder="Américain"
                />
              </div>
            </div>

            <button
                type="submit"
                :disabled="submittingDirector"
                class="w-full px-8 py-4 bg-gradient-to-r from-[#f43a00] to-[#b12f01] text-white rounded-lg font-body font-medium hover:opacity-90 transition disabled:opacity-50"
            >
              {{ submittingDirector ? 'Création...' : 'Créer le réalisateur' }}
            </button>
          </form>
        </div>
      </div>
    </section>
  </div>
</template>
