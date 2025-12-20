<script setup lang="ts">
definePageMeta({
  middleware: 'admin'
})

const admin = useAdmin()
const activeTab = ref('stats')

const formatDateForInput = (dateString: string) => {
  if (!dateString) return ''
  return dateString.split('T')[0]
}

const formatDateDisplay = (dateString?: string | null) => {
  if (!dateString) return ''
  const [date] = dateString.split('T')
  const [y, m, d] = date.split('-')
  return `${d}-${m}-${y}`
}

const stats = ref<any>(null)
const loadingStats = ref(false)
const moviesList = ref<any[]>([])
const actorsList = ref<any[]>([])
const directorsList = ref<any[]>([])

const loadStats = async () => {
  loadingStats.value = true
  try {
    stats.value = await admin.getStats()
  } catch (e) { console.error(e) }
  finally { loadingStats.value = false }
}

const loadTabData = async () => {
  try {
    if (activeTab.value === 'movies') {
      moviesList.value = await admin.getMovies()
      await loadDirectorsForMovies()
    }
    if (activeTab.value === 'actors') actorsList.value = await admin.getActors()
    if (activeTab.value === 'directors') directorsList.value = await admin.getDirectors()
  } catch (e) {
    console.error("Erreur chargement liste", e)
  }
}

watch(activeTab, (newVal) => {
  if (newVal === 'stats') loadStats()
  else {
    resetMovieForm()
    resetActorForm()
    resetDirectorForm()
    loadTabData()
  }
})

// --- GESTION FILMS ---
const movieForm = ref({
  id: null as string | null,
  name: '',
  description: '',
  releaseData: '',
  duration: 0,
  director: null as string | null,
  nbEntries: 0,
  budget: 0,
})
const submittingMovie = ref(false)
const availableDirectors = ref<any[]>([])

const loadDirectorsForMovies = async () => {
  try {
    console.log('🎬 Loading directors for movies dropdown...')
    const directors = await admin.getDirectors()
    console.log('✅ Directors loaded:', directors)
    availableDirectors.value = directors
    console.log('📝 availableDirectors set to:', availableDirectors.value)
  } catch (e) {
    console.error('❌ Erreur chargement directeurs:', e)
  }
}

const resetMovieForm = () => {
  movieForm.value = {
    id: null,
    name: '',
    description: '',
    releaseData: '',
    duration: 0,
    director: null,
    nbEntries: 0,
    budget: 0
  }
}

const editMovie = (movie: any) => {
  movieForm.value = {
    id: movie.id,
    name: movie.name,
    description: movie.description,
    releaseData: formatDateForInput(movie.releaseData),
    duration: movie.duration,
    director: movie.director?.id || null,
    nbEntries: movie.nbEntries || 0,
    budget: movie.budget || 0
  }
}

const deleteMovie = async (id: string) => {
  if (!confirm("Supprimer ce film définitivement ?")) return
  try {
    await admin.deleteMovie(id)
    await loadTabData() // Rafraîchir la liste
  } catch (e) { console.error(e) }
}

const submitMovie = async () => {
  submittingMovie.value = true
  try {
    if (movieForm.value.id) {
      await admin.updateMovie(movieForm.value.id, movieForm.value)
    } else {
      await admin.createMovie(movieForm.value)
    }
    resetMovieForm()
    await loadTabData()
  } catch (error) {
    console.error('Erreur film:', error)
  } finally {
    submittingMovie.value = false
  }
}

// --- GESTION ACTEURS ---
const actorForm = ref({
  id: null as string | null,
  firstname: '',
  lastname: '',
  dob: '',
  dod: '',
  bio: '',
})
const submittingActor = ref(false)

const resetActorForm = () => {
  actorForm.value = { id: null, firstname: '', lastname: '', dob: '', dod: '', bio: '' }
}

const editActor = (actor: any) => {
  actorForm.value = {
    id: actor.id,
    firstname: actor.firstname,
    lastname: actor.lastname,
    dob: formatDateForInput(actor.dob),
    dod: formatDateForInput(actor.dod),
    bio: actor.bio || ''
  }
}

const deleteActor = async (id: string) => {
  if (!confirm("Supprimer cet acteur ?")) return
  try {
    await admin.deleteActor(id)
    await loadTabData()
  } catch (e) { console.error(e) }
}

const submitActor = async () => {
  submittingActor.value = true
  try {
    const payload = {
      ...actorForm.value,
      dod: actorForm.value.dod || null,
    }

    if (payload.id) {
      await admin.updateActor(payload.id, payload)
    } else {
      await admin.createActor(payload)
    }

    resetActorForm()
    await loadTabData()
  } catch (error) {
    console.error(error)
  } finally {
    submittingActor.value = false
  }
}


// --- GESTION RÉALISATEURS ---
const directorForm = ref({
  id: null as string | null,
  firstname: '',
  lastname: '',
  dob: '',
  dod: '',
})
const submittingDirector = ref(false)

const resetDirectorForm = () => {
  directorForm.value = { id: null, firstname: '', lastname: '', dob: '', dod: '' }
}

const editDirector = (director: any) => {
  directorForm.value = {
    id: director.id,
    firstname: director.firstname,
    lastname: director.lastname,
    dob: formatDateForInput(director.dob),
    dod: formatDateForInput(director.dod)
  }
}

const deleteDirector = async (id: string) => {
  if (!confirm("Supprimer ce réalisateur ?")) return
  try {
    await admin.deleteDirector(id)
    await loadTabData()
  } catch (e) { console.error(e) }
}

const submitDirector = async () => {
  submittingDirector.value = true
  try {
    const payload = {
      ...directorForm.value,
      dod: directorForm.value.dod|| null,
    }

    if (payload.id) {
      await admin.updateDirector(payload.id, payload)
    } else {
      await admin.createDirector(payload)
    }

    resetDirectorForm()
    await loadTabData()
  } catch (error) {
    console.error(error)
  } finally {
    submittingDirector.value = false
  }
}

console.log('availableDirectors:', availableDirectors.value)

onMounted(() => {
  if (activeTab.value === 'stats') {
    loadStats()
  } else {
    loadTabData()
  }
})
</script>

<template>
  <div class="min-h-screen bg-[#13151d]">
    <section class="bg-gradient-to-br from-[#1b1e29] via-[#252837] to-[#1b1e29] border-b border-[#292d3e]">
      <div class="container mx-auto px-6 lg:px-12 py-20">
        <h1 class="text-5xl text-white font-display mb-4">Administration</h1>
        <p class="text-gray-400 text-lg font-body">
          Gérez les films, acteurs et réalisateurs de la plateforme
        </p>
      </div>
    </section>

    <section class="border-b border-[#292d3e] sticky top-0 z-10 bg-[#13151d]/95 backdrop-blur">
      <div class="container mx-auto px-6 lg:px-12">
        <div class="flex gap-8 overflow-x-auto">
          <button
              v-for="tab in ['stats', 'movies', 'actors', 'directors']"
              :key="tab"
              @click="activeTab = tab"
              class="py-4 px-2 font-body font-medium border-b-2 transition whitespace-nowrap hover:cursor-pointer capitalize"
              :class="activeTab === tab ? 'text-[#f43a00] border-[#f43a00]' : 'text-gray-400 border-transparent hover:text-white'"
          >
            {{ tab === 'stats' ? 'Statistiques' : (tab === 'movies' ? 'Films' : (tab === 'actors' ? 'Acteurs' : 'Réalisateurs')) }}
          </button>
        </div>
      </div>
    </section>

    <section class="py-12">
      <div class="container mx-auto px-6 lg:px-12">

        <div v-if="activeTab === 'stats'" class="max-w-4xl animate-fade-in">
          <h2 class="text-3xl text-white font-body mb-8">Statistiques globales</h2>
          <div v-if="loadingStats" class="text-gray-400">Chargement...</div>
          <div v-else-if="stats" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            <div class="bg-[#1b1e29] border border-[#292d3e] rounded-xl p-8 hover:border-[#f43a00] transition group">
              <div class="text-[#f43a00] text-4xl font-bold mb-2 group-hover:scale-110 transition-transform origin-left">
                {{ stats.movies?.totalCount || 0 }}
              </div>
              <div class="text-gray-400 font-body">Films</div>
            </div>
            <div class="bg-[#1b1e29] border border-[#292d3e] rounded-xl p-8 hover:border-[#f43a00] transition group">
              <div class="text-[#f43a00] text-4xl font-bold mb-2 group-hover:scale-110 transition-transform origin-left">
                {{ stats.actors?.totalCount || 0 }}
              </div>
              <div class="text-gray-400 font-body">Acteurs</div>
            </div>
            <div class="bg-[#1b1e29] border border-[#292d3e] rounded-xl p-8 hover:border-[#f43a00] transition group">
              <div class="text-[#f43a00] text-4xl font-bold mb-2 group-hover:scale-110 transition-transform origin-left">
                {{ stats.directors?.totalCount || 0 }}
              </div>
              <div class="text-gray-400 font-body">Réalisateurs</div>
            </div>
            <div class="bg-[#1b1e29] border border-[#292d3e] rounded-xl p-8 hover:border-[#f43a00] transition group">
              <div class="text-[#f43a00] text-4xl font-bold mb-2 group-hover:scale-110 transition-transform origin-left">
                {{ stats.categories?.totalCount || 0 }}
              </div>
              <div class="text-gray-400 font-body">Catégories</div>
            </div>
            <div class="bg-[#1b1e29] border border-[#292d3e] rounded-xl p-8 hover:border-[#f43a00] transition group">
              <div class="text-[#f43a00] text-4xl font-bold mb-2 group-hover:scale-110 transition-transform origin-left">
                {{ stats.reviews?.totalCount || 0 }}
              </div>
              <div class="text-gray-400 font-body">Reviews</div>
            </div>
          </div>
        </div>

        <div v-if="activeTab === 'movies'" class="animate-fade-in">
          <div class="flex flex-col xl:flex-row gap-8">
            <div class="xl:w-2/3 order-2 xl:order-1">
              <h2 class="text-2xl text-white mb-4">Liste des films</h2>
              <div class="bg-[#1b1e29] border border-[#292d3e] rounded-lg overflow-hidden">
                <table class="w-full text-left text-gray-400">
                  <thead class="bg-[#252837] text-white uppercase text-xs">
                  <tr>
                    <th class="px-6 py-4">Titre</th>
                    <th class="px-6 py-4 hidden md:table-cell">Date de sortie</th>
                    <th class="px-6 py-4 hidden md:table-cell">Durée</th>
                    <th class="px-6 py-4 text-right">Actions</th>
                  </tr>
                  </thead>
                  <tbody class="divide-y divide-[#292d3e]">
                  <tr v-for="movie in moviesList" :key="movie.id" class="hover:bg-[#252837] transition">
                    <td class="px-6 py-4 font-medium text-white">{{ movie.name }}</td>
                    <td class="px-6 py-4 hidden md:table-cell">{{ formatDateDisplay(movie.releaseData) }}</td>
                    <td class="px-6 py-4 hidden md:table-cell">{{ movie.duration }} min</td>
                    <td class="px-6 py-4 text-right space-x-4">
                      <button @click="editMovie(movie)" class="hover:cursor-pointer">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18">
                          <path fill="gray" d="M19.14,12.94c0.04-0.3,0.06-0.61,0.06-0.94c0-0.32-0.02-0.64-0.07-0.94l2.03-1.58c0.18-0.14,0.23-0.41,0.12-0.61 l-1.92-3.32c-0.12-0.22-0.37-0.29-0.59-0.22l-2.39,0.96c-0.5-0.38-1.03-0.7-1.62-0.94L14.4,2.81c-0.04-0.24-0.24-0.41-0.48-0.41 h-3.84c-0.24,0-0.43,0.17-0.47,0.41L9.25,5.35C8.66,5.59,8.12,5.92,7.63,6.29L5.24,5.33c-0.22-0.08-0.47,0-0.59,0.22L2.74,8.87 C2.62,9.08,2.66,9.34,2.86,9.48l2.03,1.58C4.84,11.36,4.8,11.69,4.8,12s0.02,0.64,0.07,0.94l-2.03,1.58 c-0.18,0.14-0.23,0.41-0.12,0.61l1.92,3.32c0.12,0.22,0.37,0.29,0.59,0.22l2.39-0.96c0.5,0.38,1.03,0.7,1.62,0.94l0.36,2.54 c0.05,0.24,0.24,0.41,0.48,0.41h3.84c0.24,0,0.44-0.17,0.47-0.41l0.36-2.54c0.59-0.24,1.13-0.56,1.62-0.94l2.39,0.96 c0.22,0.08,0.47,0,0.59-0.22l1.92-3.32c0.12-0.22,0.07-0.47-0.12-0.61L19.14,12.94z M12,15.6c-1.98,0-3.6-1.62-3.6-3.6 s1.62-3.6,3.6-3.6s3.6,1.62,3.6,3.6S13.98,15.6,12,15.6z"/>
                        </svg>
                      </button>
                      <button @click="deleteMovie(movie.id)" class="hover:cursor-pointer">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24"
                             fill="none" stroke="#e60000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                          <path d="M3 6h18"/>
                          <path d="M8 6V4h8v2"/>
                          <path d="M6 6l1 16h10l1-16"/>
                          <path d="M10 11v7"/>
                          <path d="M14 11v7"/>
                        </svg>

                      </button>
                    </td>
                  </tr>
                  <tr v-if="moviesList.length === 0">
                    <td colspan="4" class="px-6 py-8 text-center text-gray-500">Aucun film trouvé.</td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>

            <div class="xl:w-1/3 order-1 xl:order-2 mt-12">
              <div class="sticky top-24 bg-[#1b1e29] border border-[#292d3e] rounded-xl p-6 shadow-xl">
                <div class="flex justify-between items-center mb-6 border-b border-[#292d3e] pb-4">
                  <h3 class="text-xl text-white font-bold">
                    {{ movieForm.id ? 'Modifier le film' : 'Ajouter un film' }}
                  </h3>
                  <button v-if="movieForm.id" @click="resetMovieForm" class="text-xs text-gray-400 hover:text-white hover:cursor-pointer uppercase tracking-wider">
                    Annuler
                  </button>
                </div>

                <form @submit.prevent="submitMovie" class="space-y-4">
                  <div>
                    <label class="block text-gray-400 text-xs uppercase tracking-wide mb-1">Titre</label>
                    <input v-model="movieForm.name" type="text" required class="w-full px-4 py-2 bg-[#13151d] border border-[#292d3e] rounded text-white focus:border-[#f43a00] outline-none transition" />
                  </div>
                  <div>
                    <label class="block text-gray-400 text-xs uppercase tracking-wide mb-1">Description</label>
                    <textarea v-model="movieForm.description" rows="3" required class="w-full px-4 py-2 bg-[#13151d] border border-[#292d3e] rounded text-white focus:border-[#f43a00] outline-none transition"></textarea>
                  </div>
                  <div class="grid grid-cols-2 gap-4">
                    <div>
                      <label class="block text-gray-400 text-xs uppercase tracking-wide mb-1">Date sortie</label>
                      <input v-model="movieForm.releaseData" type="date" required class="w-full px-4 py-2 bg-[#13151d] border border-[#292d3e] rounded text-white focus:border-[#f43a00] outline-none transition" />
                    </div>
                    <div>
                      <label class="block text-gray-400 text-xs uppercase tracking-wide mb-1">Durée (min)</label>
                      <input v-model.number="movieForm.duration" type="number" required class="w-full px-4 py-2 bg-[#13151d] border border-[#292d3e] rounded text-white focus:border-[#f43a00] outline-none transition" />
                    </div>
                  </div>
                  <div>
                    <label class="block text-gray-400 text-xs uppercase tracking-wide mb-1">Réalisateur</label>
                    <select v-model="movieForm.director" class="w-full px-4 py-2 bg-[#13151d] border border-[#292d3e] rounded text-white focus:border-[#f43a00] outline-none transition">
                      <option :value="null">Aucun réalisateur</option>
                      <option v-for="director in availableDirectors" :key="director.id" :value="director.id" class="text-white">
                        {{ director.firstname }} {{ director.lastname }}
                      </option>
                    </select>
                  </div>
                  <div class="grid grid-cols-2 gap-4">
                    <div>
                      <label class="block text-gray-400 text-xs uppercase tracking-wide mb-1">Nombre d'entrées</label>
                      <input v-model.number="movieForm.nbEntries" type="number" min="0" class="w-full px-4 py-2 bg-[#13151d] border border-[#292d3e] rounded text-white focus:border-[#f43a00] outline-none transition" />
                    </div>
                    <div>
                      <label class="block text-gray-400 text-xs uppercase tracking-wide mb-1">Budget (€)</label>
                      <input v-model.number="movieForm.budget" type="number" min="0" step="0.01" class="w-full px-4 py-2 bg-[#13151d] border border-[#292d3e] rounded text-white focus:border-[#f43a00] outline-none transition" />
                    </div>
                  </div>
                  <button type="submit" :disabled="submittingMovie" class="w-full py-3 mt-2 bg-gradient-to-r from-[#f43a00] to-[#b12f01] hover:cursor-pointer hover:opacity-90 text-white rounded font-medium transition disabled:opacity-50">
                    {{ submittingMovie ? 'Sauvegarde...' : (movieForm.id ? 'Mettre à jour' : 'Créer le film') }}
                  </button>
                </form>
              </div>
            </div>
          </div>
        </div>

        <div v-if="activeTab === 'actors'" class="animate-fade-in">
          <div class="flex flex-col xl:flex-row gap-8">
            <div class="xl:w-2/3 order-2 xl:order-1">
              <h2 class="text-2xl text-white mb-4">Liste des acteurs</h2>
              <div class="bg-[#1b1e29] border border-[#292d3e] rounded-lg overflow-hidden">
                <table class="w-full text-left text-gray-400">
                  <thead class="bg-[#252837] text-white uppercase text-xs">
                  <tr>
                    <th class="px-6 py-4">Nom</th>
                    <th class="px-6 py-4">Prénom</th>
                    <th class="px-6 py-4 hidden md:table-cell">Naissance</th>
                    <th class="px-6 py-4 hidden md:table-cell">Decès</th>
                    <th class="px-6 py-4 text-right">Actions</th>
                  </tr>
                  </thead>
                  <tbody class="divide-y divide-[#292d3e]">
                  <tr v-for="actor in actorsList" :key="actor.id" class="hover:bg-[#252837] transition">
                    <td class="px-6 py-4 font-medium text-white">{{ actor.lastname }}</td>
                    <td class="px-6 py-4">{{ actor.firstname }}</td>
                    <td class="px-6 py-4 hidden md:table-cell">{{ formatDateDisplay(actor.dob) }}</td>
                    <td class="px-6 py-4 hidden md:table-cell">{{ formatDateDisplay(actor.dod) }}</td>
                    <td class="px-6 py-4 text-right space-x-4">
                      <button @click="editActor(actor)" class="hover:cursor-pointer">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18">
                          <path fill="gray" d="M19.14,12.94c0.04-0.3,0.06-0.61,0.06-0.94c0-0.32-0.02-0.64-0.07-0.94l2.03-1.58c0.18-0.14,0.23-0.41,0.12-0.61 l-1.92-3.32c-0.12-0.22-0.37-0.29-0.59-0.22l-2.39,0.96c-0.5-0.38-1.03-0.7-1.62-0.94L14.4,2.81c-0.04-0.24-0.24-0.41-0.48-0.41 h-3.84c-0.24,0-0.43,0.17-0.47,0.41L9.25,5.35C8.66,5.59,8.12,5.92,7.63,6.29L5.24,5.33c-0.22-0.08-0.47,0-0.59,0.22L2.74,8.87 C2.62,9.08,2.66,9.34,2.86,9.48l2.03,1.58C4.84,11.36,4.8,11.69,4.8,12s0.02,0.64,0.07,0.94l-2.03,1.58 c-0.18,0.14-0.23,0.41-0.12,0.61l1.92,3.32c0.12,0.22,0.37,0.29,0.59,0.22l2.39-0.96c0.5,0.38,1.03,0.7,1.62,0.94l0.36,2.54 c0.05,0.24,0.24,0.41,0.48,0.41h3.84c0.24,0,0.44-0.17,0.47-0.41l0.36-2.54c0.59-0.24,1.13-0.56,1.62-0.94l2.39,0.96 c0.22,0.08,0.47,0,0.59-0.22l1.92-3.32c0.12-0.22,0.07-0.47-0.12-0.61L19.14,12.94z M12,15.6c-1.98,0-3.6-1.62-3.6-3.6 s1.62-3.6,3.6-3.6s3.6,1.62,3.6,3.6S13.98,15.6,12,15.6z"/>
                        </svg>
                      </button>
                      <button @click="deleteActor(actor.id)" class="hover:cursor-pointer">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                        fill="none" stroke="#e60000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M3 6h18"/>
                        <path d="M8 6V4h8v2"/>
                        <path d="M6 6l1 16h10l1-16"/>
                        <path d="M10 11v7"/>
                        <path d="M14 11v7"/>
                      </svg>
                      </button>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>

            <div class="xl:w-1/3 order-1 xl:order-2 mt-12">
              <div class="sticky top-24 bg-[#1b1e29] border border-[#292d3e] rounded-xl p-6 shadow-xl">
                <div class="flex justify-between items-center mb-6 border-b border-[#292d3e] pb-4">
                  <h3 class="text-xl text-white font-bold">{{ actorForm.id ? 'Modifier' : 'Ajouter' }} un acteur</h3>
                  <button v-if="actorForm.id" @click="resetActorForm" class="text-xs text-gray-400 hover:text-white hover:cursor-pointer uppercase tracking-wider">Annuler</button>
                </div>
                <form @submit.prevent="submitActor" class="space-y-4">
                  <div class="grid grid-cols-2 gap-4">
                    <div>
                      <label class="block text-gray-400 text-xs uppercase mb-1">Prénom</label>
                      <input v-model="actorForm.firstname" required class="w-full px-4 py-2 bg-[#13151d] border border-[#292d3e] rounded text-white focus:border-[#f43a00] outline-none" />
                    </div>
                    <div>
                      <label class="block text-gray-400 text-xs uppercase mb-1">Nom</label>
                      <input v-model="actorForm.lastname" required class="w-full px-4 py-2 bg-[#13151d] border border-[#292d3e] rounded text-white focus:border-[#f43a00] outline-none" />
                    </div>
                  </div>
                  <div class="grid grid-cols-2 gap-4">
                    <div>
                      <label class="block text-gray-400 text-xs uppercase mb-1">Naissance</label>
                      <input v-model="actorForm.dob" type="date" class="w-full px-4 py-2 bg-[#13151d] border border-[#292d3e] rounded text-white focus:border-[#f43a00] outline-none" />
                    </div>
                    <div>
                      <label class="block text-gray-400 text-xs uppercase mb-1">Décès</label>
                      <input v-model="actorForm.dod" type="date" class="w-full px-4 py-2 bg-[#13151d] border border-[#292d3e] rounded text-white focus:border-[#f43a00] outline-none" />
                    </div>
                  </div>
                  <div>
                    <label class="block text-gray-400 text-xs uppercase mb-1">Biographie</label>
                    <textarea v-model="actorForm.bio" rows="3" class="w-full px-4 py-2 bg-[#13151d] border border-[#292d3e] rounded text-white focus:border-[#f43a00] outline-none"></textarea>
                  </div>
                  <button type="submit" :disabled="submittingActor" class="w-full py-3 mt-2 bg-gradient-to-r from-[#f43a00] to-[#b12f01] hover:opacity-90 hover:cursor-pointer text-white rounded font-medium transition disabled:opacity-50">
                    {{ submittingActor ? 'Sauvegarde...' : (actorForm.id ? 'Mettre à jour' : 'Créer l\'acteur') }}
                  </button>
                </form>
              </div>
            </div>
          </div>
        </div>

        <div v-if="activeTab === 'directors'" class="animate-fade-in">
          <div class="flex flex-col xl:flex-row gap-8">
            <div class="xl:w-2/3 order-2 xl:order-1">
              <h2 class="text-2xl text-white mb-4">Liste des réalisateurs</h2>
              <div class="bg-[#1b1e29] border border-[#292d3e] rounded-lg overflow-hidden">
                <table class="w-full text-left text-gray-400">
                  <thead class="bg-[#252837] text-white uppercase text-xs">
                  <tr>
                    <th class="px-6 py-4">Nom</th>
                    <th class="px-6 py-4">Prénom</th>
                    <th class="px-6 py-4 hidden md:table-cell">Naissance</th>
                    <th class="px-6 py-4 hidden md:table-cell">Décès</th>
                    <th class="px-6 py-4 text-right">Actions</th>
                  </tr>
                  </thead>
                  <tbody class="divide-y divide-[#292d3e]">
                  <tr v-for="director in directorsList" :key="director.id" class="hover:bg-[#252837] transition">
                    <td class="px-6 py-4 font-medium text-white">{{ director.lastname }}</td>
                    <td class="px-6 py-4">{{ director.firstname }}</td>
                    <td class="px-6 py-4 hidden md:table-cell">{{ formatDateDisplay(director.dob) }}</td>
                    <td class="px-6 py-4 hidden md:table-cell">{{ formatDateDisplay(director.dod) }}</td>
                    <td class="px-6 py-4 text-right space-x-4">
                      <button @click="editDirector(director)" class="hover:cursor-pointer">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18">
                          <path fill="gray" d="M19.14,12.94c0.04-0.3,0.06-0.61,0.06-0.94c0-0.32-0.02-0.64-0.07-0.94l2.03-1.58c0.18-0.14,0.23-0.41,0.12-0.61 l-1.92-3.32c-0.12-0.22-0.37-0.29-0.59-0.22l-2.39,0.96c-0.5-0.38-1.03-0.7-1.62-0.94L14.4,2.81c-0.04-0.24-0.24-0.41-0.48-0.41 h-3.84c-0.24,0-0.43,0.17-0.47,0.41L9.25,5.35C8.66,5.59,8.12,5.92,7.63,6.29L5.24,5.33c-0.22-0.08-0.47,0-0.59,0.22L2.74,8.87 C2.62,9.08,2.66,9.34,2.86,9.48l2.03,1.58C4.84,11.36,4.8,11.69,4.8,12s0.02,0.64,0.07,0.94l-2.03,1.58 c-0.18,0.14-0.23,0.41-0.12,0.61l1.92,3.32c0.12,0.22,0.37,0.29,0.59,0.22l2.39-0.96c0.5,0.38,1.03,0.7,1.62,0.94l0.36,2.54 c0.05,0.24,0.24,0.41,0.48,0.41h3.84c0.24,0,0.44-0.17,0.47-0.41l0.36-2.54c0.59-0.24,1.13-0.56,1.62-0.94l2.39,0.96 c0.22,0.08,0.47,0,0.59-0.22l1.92-3.32c0.12-0.22,0.07-0.47-0.12-0.61L19.14,12.94z M12,15.6c-1.98,0-3.6-1.62-3.6-3.6 s1.62-3.6,3.6-3.6s3.6,1.62,3.6,3.6S13.98,15.6,12,15.6z"/>
                        </svg>
                      </button>
                      <button @click="deleteDirector(director.id)" class="hover:cursor-pointer">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                             fill="none" stroke="#e60000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                          <path d="M3 6h18"/>
                          <path d="M8 6V4h8v2"/>
                          <path d="M6 6l1 16h10l1-16"/>
                          <path d="M10 11v7"/>
                          <path d="M14 11v7"/>
                        </svg>
                      </button>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>

            <div class="xl:w-1/3 order-1 xl:order-2 mt-12">
              <div class="sticky top-24 bg-[#1b1e29] border border-[#292d3e] rounded-xl p-6 shadow-xl">
                <div class="flex justify-between items-center mb-6 border-b border-[#292d3e] pb-4">
                  <h3 class="text-xl text-white font-bold">{{ directorForm.id ? 'Modifier' : 'Ajouter' }} un réalisateur</h3>
                  <button v-if="directorForm.id" @click="resetDirectorForm" class="text-xs text-gray-400 hover:text-white hover:cursor-pointer uppercase tracking-wider">Annuler</button>
                </div>
                <form @submit.prevent="submitDirector" class="space-y-4">
                  <div class="grid grid-cols-2 gap-4">
                    <div>
                      <label class="block text-gray-400 text-xs uppercase mb-1">Prénom</label>
                      <input v-model="directorForm.firstname" required class="w-full px-4 py-2 bg-[#13151d] border border-[#292d3e] rounded text-white focus:border-[#f43a00] outline-none" />
                    </div>
                    <div>
                      <label class="block text-gray-400 text-xs uppercase mb-1">Nom</label>
                      <input v-model="directorForm.lastname" required class="w-full px-4 py-2 bg-[#13151d] border border-[#292d3e] rounded text-white focus:border-[#f43a00] outline-none" />
                    </div>
                  </div>
                  <div>
                    <label class="block text-gray-400 text-xs uppercase mb-1">Naissance</label>
                    <input v-model="directorForm.dob" type="date" class="w-full px-4 py-2 bg-[#13151d] border border-[#292d3e] rounded text-white focus:border-[#f43a00] outline-none" />
                  </div>
                  <div>
                    <label class="block text-gray-400 text-xs uppercase mb-1">Décès</label>
                    <input v-model="directorForm.dod" type="date" class="w-full px-4 py-2 bg-[#13151d] border border-[#292d3e] rounded text-white focus:border-[#f43a00] outline-none" />
                  </div>
                  <button type="submit" :disabled="submittingDirector" class="w-full py-3 mt-2 bg-gradient-to-r from-[#f43a00] to-[#b12f01] hover:cursor-pointer hover:opacity-90 text-white rounded font-medium transition disabled:opacity-50">
                    {{ submittingDirector ? 'Sauvegarde...' : (directorForm.id ? 'Mettre à jour' : 'Créer le réalisateur') }}
                  </button>
                </form>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section>
  </div>
</template>

<style scoped>
/* Petite animation d'entrée */
.animate-fade-in {
  animation: fadeIn 0.3s ease-in-out;
}
@keyframes fadeIn {
  from { opacity: 0; transform: translateY(10px); }
  to { opacity: 1; transform: translateY(0); }
}
</style>