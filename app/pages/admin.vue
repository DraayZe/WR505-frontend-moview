<script setup lang="ts">
import { Settings, Film, Users, Clapperboard, BarChart3, Plus, Pencil, Trash2, X } from 'lucide-vue-next'

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
  if (!dateString) return '—'
  const [date] = dateString.split('T')
  const [y, m, d] = date.split('-')
  return `${d}/${m}/${y}`
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
    const directors = await admin.getDirectors()
    availableDirectors.value = directors
  } catch (e) {
    console.error('Erreur chargement directeurs:', e)
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
    await loadTabData()
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

// --- GESTION REALISATEURS ---
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
      dod: directorForm.value.dod || null,
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

const tabs = [
  { id: 'stats', label: 'Statistiques', icon: BarChart3 },
  { id: 'movies', label: 'Films', icon: Film },
  { id: 'actors', label: 'Acteurs', icon: Users },
  { id: 'directors', label: 'Réalisateurs', icon: Clapperboard },
]

onMounted(() => {
  if (activeTab.value === 'stats') {
    loadStats()
  } else {
    loadTabData()
  }
})
</script>

<template>
  <div class="min-h-screen bg-[#0a0a0c]">
    <section class="relative pt-32 pb-12 overflow-hidden">
      <div class="absolute inset-0">
        <div class="absolute top-0 left-1/4 w-96 h-96 bg-[#d4af37]/5 rounded-full blur-3xl"></div>
      </div>

      <div class="relative z-10 container mx-auto px-6 lg:px-12">
        <div class="flex items-center gap-4 mb-6">
          <Settings class="w-6 h-6 text-[#d4af37]" />
          <span class="text-[#d4af37] text-sm tracking-[0.3em] uppercase font-body">Panneau de contrôle</span>
        </div>
        <h1 class="font-display text-5xl lg:text-6xl text-white mb-4">
          Administration
        </h1>
        <p class="font-body text-[#c0c0c0] text-lg">
          Gérez les films, acteurs et réalisateurs de la plateforme.
        </p>
      </div>
    </section>

    <section class="border-y border-[#d4af37]/10 bg-[#0a0a0c]/95 backdrop-blur-sm sticky top-[72px] z-40">
      <div class="container mx-auto px-6 lg:px-12">
        <div class="flex gap-2 overflow-x-auto py-4">
          <button
            v-for="tab in tabs"
            :key="tab.id"
            @click="activeTab = tab.id"
            :class="[
              'hover:cursor-pointer flex items-center gap-2 px-6 py-3 font-body font-medium transition-all duration-300 whitespace-nowrap',
              activeTab === tab.id
                ? 'bg-[#d4af37] text-[#0a0a0c]'
                : 'text-[#c0c0c0] hover:text-white border border-[#d4af37]/20 hover:border-[#d4af37]/40'
            ]"
          >
            <component :is="tab.icon" class="w-4 h-4" />
            {{ tab.label }}
          </button>
        </div>
      </div>
    </section>

    <section class="py-12">
      <div class="container mx-auto px-6 lg:px-12">
        <div v-if="activeTab === 'stats'" class="animate-fade-in">
          <h2 class="font-display text-3xl text-white mb-8">Statistiques <span class="italic text-gold-gradient">globales</span></h2>

          <div v-if="loadingStats" class="flex items-center justify-center py-12">
            <div class="w-10 h-10 border-2 border-[#d4af37]/20 border-t-[#d4af37] rounded-full animate-spin"></div>
          </div>

          <div v-else-if="stats" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-6">
            <div class="group p-8 bg-[#12121a] border border-[#d4af37]/10 hover:border-[#d4af37]/30 transition-all duration-300">
              <Film class="w-8 h-8 text-[#d4af37] mb-4" />
              <div class="font-display text-4xl text-white mb-2 group-hover:text-[#d4af37] transition-colors">
                {{ stats.movies?.totalCount || 0 }}
              </div>
              <div class="font-body text-[#c0c0c0]">Films</div>
            </div>

            <div class="group p-8 bg-[#12121a] border border-[#d4af37]/10 hover:border-[#d4af37]/30 transition-all duration-300">
              <Users class="w-8 h-8 text-[#d4af37] mb-4" />
              <div class="font-display text-4xl text-white mb-2 group-hover:text-[#d4af37] transition-colors">
                {{ stats.actors?.totalCount || 0 }}
              </div>
              <div class="font-body text-[#c0c0c0]">Acteurs</div>
            </div>

            <div class="group p-8 bg-[#12121a] border border-[#d4af37]/10 hover:border-[#d4af37]/30 transition-all duration-300">
              <Clapperboard class="w-8 h-8 text-[#d4af37] mb-4" />
              <div class="font-display text-4xl text-white mb-2 group-hover:text-[#d4af37] transition-colors">
                {{ stats.directors?.totalCount || 0 }}
              </div>
              <div class="font-body text-[#c0c0c0]">Réalisateurs</div>
            </div>

            <div class="group p-8 bg-[#12121a] border border-[#d4af37]/10 hover:border-[#d4af37]/30 transition-all duration-300">
              <BarChart3 class="w-8 h-8 text-[#d4af37] mb-4" />
              <div class="font-display text-4xl text-white mb-2 group-hover:text-[#d4af37] transition-colors">
                {{ stats.categories?.totalCount || 0 }}
              </div>
              <div class="font-body text-[#c0c0c0]">Catégories</div>
            </div>

            <div class="group p-8 bg-[#12121a] border border-[#d4af37]/10 hover:border-[#d4af37]/30 transition-all duration-300">
              <Settings class="w-8 h-8 text-[#d4af37] mb-4" />
              <div class="font-display text-4xl text-white mb-2 group-hover:text-[#d4af37] transition-colors">
                {{ stats.reviews?.totalCount || 0 }}
              </div>
              <div class="font-body text-[#c0c0c0]">Avis</div>
            </div>
          </div>
        </div>

        <div v-if="activeTab === 'movies'" class="animate-fade-in">
          <div class="flex flex-col xl:flex-row gap-8">
            <div class="xl:w-2/3 order-2 xl:order-1">
              <h2 class="font-display text-2xl text-white mb-6">Liste des <span class="italic text-gold-gradient">films</span></h2>

              <div class="bg-[#12121a] border border-[#d4af37]/10 overflow-hidden">
                <table class="w-full text-left">
                  <thead class="bg-[#0a0a0c] border-b border-[#d4af37]/10">
                    <tr>
                      <th class="px-6 py-4 font-body text-[#d4af37] text-xs uppercase tracking-wider">Titre</th>
                      <th class="px-6 py-4 font-body text-[#d4af37] text-xs uppercase tracking-wider hidden md:table-cell">Date</th>
                      <th class="px-6 py-4 font-body text-[#d4af37] text-xs uppercase tracking-wider hidden md:table-cell">Durée</th>
                      <th class="px-6 py-4 font-body text-[#d4af37] text-xs uppercase tracking-wider text-right">Actions</th>
                    </tr>
                  </thead>
                  <tbody class="divide-y divide-[#d4af37]/10">
                    <tr v-for="movie in moviesList" :key="movie.id" class="hover:bg-[#d4af37]/5 transition-colors">
                      <td class="px-6 py-4 font-body text-white">{{ movie.name }}</td>
                      <td class="px-6 py-4 font-body text-[#c0c0c0] hidden md:table-cell">{{ formatDateDisplay(movie.releaseData) }}</td>
                      <td class="px-6 py-4 font-body text-[#c0c0c0] hidden md:table-cell">{{ movie.duration }} min</td>
                      <td class="px-6 py-4 text-right">
                        <div class="flex items-center justify-end gap-2">
                          <button @click="editMovie(movie)" class="hover:cursor-pointer p-2 text-[#c0c0c0] hover:text-[#d4af37] transition-colors">
                            <Pencil class="w-4 h-4" />
                          </button>
                          <button @click="deleteMovie(movie.id)" class="hover:cursor-pointer p-2 text-[#c0c0c0] hover:text-red-500 transition-colors">
                            <Trash2 class="w-4 h-4" />
                          </button>
                        </div>
                      </td>
                    </tr>
                    <tr v-if="moviesList.length === 0">
                      <td colspan="4" class="px-6 py-12 text-center text-[#c0c0c0] font-body">Aucun film trouvé.</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>

            <div class="xl:w-1/3 order-1 xl:order-2">
              <div class="sticky top-36 bg-[#12121a] border border-[#d4af37]/10 p-6">
                <div class="flex items-center justify-between mb-6 pb-4 border-b border-[#d4af37]/10">
                  <h3 class="font-display text-xl text-white flex items-center gap-2">
                    <Plus v-if="!movieForm.id" class="w-5 h-5 text-[#d4af37]" />
                    <Pencil v-else class="w-5 h-5 text-[#d4af37]" />
                    {{ movieForm.id ? 'Modifier' : 'Ajouter' }} un film
                  </h3>
                  <button v-if="movieForm.id" @click="resetMovieForm" class="p-2 text-[#c0c0c0] hover:text-white transition-colors">
                    <X class="w-5 h-5" />
                  </button>
                </div>

                <form @submit.prevent="submitMovie" class="space-y-4">
                  <div>
                    <label class="block text-[#c0c0c0] text-xs uppercase tracking-wider mb-2 font-body">Titre</label>
                    <input v-model="movieForm.name" type="text" required class="w-full px-4 py-3 bg-[#0a0a0c] border border-[#d4af37]/20 text-white font-body focus:border-[#d4af37] outline-none transition-colors" />
                  </div>
                  <div>
                    <label class="block text-[#c0c0c0] text-xs uppercase tracking-wider mb-2 font-body">Description</label>
                    <textarea v-model="movieForm.description" rows="3" required class="w-full px-4 py-3 bg-[#0a0a0c] border border-[#d4af37]/20 text-white font-body focus:border-[#d4af37] outline-none transition-colors resize-none"></textarea>
                  </div>
                  <div class="grid grid-cols-2 gap-4">
                    <div>
                      <label class="block text-[#c0c0c0] text-xs uppercase tracking-wider mb-2 font-body">Date sortie</label>
                      <input v-model="movieForm.releaseData" type="date" required class="w-full px-4 py-3 bg-[#0a0a0c] border border-[#d4af37]/20 text-white font-body focus:border-[#d4af37] outline-none transition-colors" />
                    </div>
                    <div>
                      <label class="block text-[#c0c0c0] text-xs uppercase tracking-wider mb-2 font-body">Durée (min)</label>
                      <input v-model.number="movieForm.duration" type="number" required class="w-full px-4 py-3 bg-[#0a0a0c] border border-[#d4af37]/20 text-white font-body focus:border-[#d4af37] outline-none transition-colors" />
                    </div>
                  </div>
                  <div>
                    <label class="block text-[#c0c0c0] text-xs uppercase tracking-wider mb-2 font-body">Réalisateur</label>
                    <select v-model="movieForm.director" class="w-full px-4 py-3 bg-[#0a0a0c] border border-[#d4af37]/20 text-white font-body focus:border-[#d4af37] outline-none transition-colors">
                      <option :value="null">Aucun réalisateur</option>
                      <option v-for="director in availableDirectors" :key="director.id" :value="director.id">
                        {{ director.firstname }} {{ director.lastname }}
                      </option>
                    </select>
                  </div>
                  <div class="grid grid-cols-2 gap-4">
                    <div>
                      <label class="block text-[#c0c0c0] text-xs uppercase tracking-wider mb-2 font-body">Entrées</label>
                      <input v-model.number="movieForm.nbEntries" type="number" min="0" class="w-full px-4 py-3 bg-[#0a0a0c] border border-[#d4af37]/20 text-white font-body focus:border-[#d4af37] outline-none transition-colors" />
                    </div>
                    <div>
                      <label class="block text-[#c0c0c0] text-xs uppercase tracking-wider mb-2 font-body">Budget (€)</label>
                      <input v-model.number="movieForm.budget" type="number" min="0" class="w-full px-4 py-3 bg-[#0a0a0c] border border-[#d4af37]/20 text-white font-body focus:border-[#d4af37] outline-none transition-colors" />
                    </div>
                  </div>
                  <button type="submit" :disabled="submittingMovie" class="hover:cursor-pointer w-full py-4 mt-4 bg-gradient-to-r from-[#d4af37] to-[#a68a2a] text-[#0a0a0c] font-body font-semibold hover:brightness-110 transition-all duration-300 disabled:opacity-50">
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
              <h2 class="font-display text-2xl text-white mb-6">Liste des <span class="italic text-gold-gradient">acteurs</span></h2>

              <div class="bg-[#12121a] border border-[#d4af37]/10 overflow-hidden">
                <table class="w-full text-left">
                  <thead class="bg-[#0a0a0c] border-b border-[#d4af37]/10">
                    <tr>
                      <th class="px-6 py-4 font-body text-[#d4af37] text-xs uppercase tracking-wider">Nom</th>
                      <th class="px-6 py-4 font-body text-[#d4af37] text-xs uppercase tracking-wider">Prénom</th>
                      <th class="px-6 py-4 font-body text-[#d4af37] text-xs uppercase tracking-wider hidden md:table-cell">Naissance</th>
                      <th class="px-6 py-4 font-body text-[#d4af37] text-xs uppercase tracking-wider text-right">Actions</th>
                    </tr>
                  </thead>
                  <tbody class="divide-y divide-[#d4af37]/10">
                    <tr v-for="actor in actorsList" :key="actor.id" class="hover:bg-[#d4af37]/5 transition-colors">
                      <td class="px-6 py-4 font-body text-white">{{ actor.lastname }}</td>
                      <td class="px-6 py-4 font-body text-[#c0c0c0]">{{ actor.firstname }}</td>
                      <td class="px-6 py-4 font-body text-[#c0c0c0] hidden md:table-cell">{{ formatDateDisplay(actor.dob) }}</td>
                      <td class="px-6 py-4 text-right">
                        <div class="flex items-center justify-end gap-2">
                          <button @click="editActor(actor)" class="hover:cursor-pointer p-2 text-[#c0c0c0] hover:text-[#d4af37] transition-colors">
                            <Pencil class="w-4 h-4" />
                          </button>
                          <button @click="deleteActor(actor.id)" class="hover:cursor-pointer p-2 text-[#c0c0c0] hover:text-red-500 transition-colors">
                            <Trash2 class="w-4 h-4" />
                          </button>
                        </div>
                      </td>
                    </tr>
                    <tr v-if="actorsList.length === 0">
                      <td colspan="4" class="px-6 py-12 text-center text-[#c0c0c0] font-body">Aucun acteur trouvé.</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>

            <div class="xl:w-1/3 order-1 xl:order-2">
              <div class="sticky top-36 bg-[#12121a] border border-[#d4af37]/10 p-6">
                <div class="flex items-center justify-between mb-6 pb-4 border-b border-[#d4af37]/10">
                  <h3 class="font-display text-xl text-white flex items-center gap-2">
                    <Plus v-if="!actorForm.id" class="w-5 h-5 text-[#d4af37]" />
                    <Pencil v-else class="w-5 h-5 text-[#d4af37]" />
                    {{ actorForm.id ? 'Modifier' : 'Ajouter' }} un acteur
                  </h3>
                  <button v-if="actorForm.id" @click="resetActorForm" class="p-2 text-[#c0c0c0] hover:text-white transition-colors">
                    <X class="w-5 h-5" />
                  </button>
                </div>

                <form @submit.prevent="submitActor" class="space-y-4">
                  <div class="grid grid-cols-2 gap-4">
                    <div>
                      <label class="block text-[#c0c0c0] text-xs uppercase tracking-wider mb-2 font-body">Prénom</label>
                      <input v-model="actorForm.firstname" required class="w-full px-4 py-3 bg-[#0a0a0c] border border-[#d4af37]/20 text-white font-body focus:border-[#d4af37] outline-none transition-colors" />
                    </div>
                    <div>
                      <label class="block text-[#c0c0c0] text-xs uppercase tracking-wider mb-2 font-body">Nom</label>
                      <input v-model="actorForm.lastname" required class="w-full px-4 py-3 bg-[#0a0a0c] border border-[#d4af37]/20 text-white font-body focus:border-[#d4af37] outline-none transition-colors" />
                    </div>
                  </div>
                  <div class="grid grid-cols-2 gap-4">
                    <div>
                      <label class="block text-[#c0c0c0] text-xs uppercase tracking-wider mb-2 font-body">Naissance</label>
                      <input v-model="actorForm.dob" type="date" class="w-full px-4 py-3 bg-[#0a0a0c] border border-[#d4af37]/20 text-white font-body focus:border-[#d4af37] outline-none transition-colors" />
                    </div>
                    <div>
                      <label class="block text-[#c0c0c0] text-xs uppercase tracking-wider mb-2 font-body">Décès</label>
                      <input v-model="actorForm.dod" type="date" class="w-full px-4 py-3 bg-[#0a0a0c] border border-[#d4af37]/20 text-white font-body focus:border-[#d4af37] outline-none transition-colors" />
                    </div>
                  </div>
                  <div>
                    <label class="block text-[#c0c0c0] text-xs uppercase tracking-wider mb-2 font-body">Biographie</label>
                    <textarea v-model="actorForm.bio" rows="3" class="w-full px-4 py-3 bg-[#0a0a0c] border border-[#d4af37]/20 text-white font-body focus:border-[#d4af37] outline-none transition-colors resize-none"></textarea>
                  </div>
                  <button type="submit" :disabled="submittingActor" class="hover:cursor-pointer w-full py-4 mt-4 bg-gradient-to-r from-[#d4af37] to-[#a68a2a] text-[#0a0a0c] font-body font-semibold hover:brightness-110 transition-all duration-300 disabled:opacity-50">
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
              <h2 class="font-display text-2xl text-white mb-6">Liste des <span class="italic text-gold-gradient">réalisateurs</span></h2>

              <div class="bg-[#12121a] border border-[#d4af37]/10 overflow-hidden">
                <table class="w-full text-left">
                  <thead class="bg-[#0a0a0c] border-b border-[#d4af37]/10">
                    <tr>
                      <th class="px-6 py-4 font-body text-[#d4af37] text-xs uppercase tracking-wider">Nom</th>
                      <th class="px-6 py-4 font-body text-[#d4af37] text-xs uppercase tracking-wider">Prénom</th>
                      <th class="px-6 py-4 font-body text-[#d4af37] text-xs uppercase tracking-wider hidden md:table-cell">Naissance</th>
                      <th class="px-6 py-4 font-body text-[#d4af37] text-xs uppercase tracking-wider text-right">Actions</th>
                    </tr>
                  </thead>
                  <tbody class="divide-y divide-[#d4af37]/10">
                    <tr v-for="director in directorsList" :key="director.id" class="hover:bg-[#d4af37]/5 transition-colors">
                      <td class="px-6 py-4 font-body text-white">{{ director.lastname }}</td>
                      <td class="px-6 py-4 font-body text-[#c0c0c0]">{{ director.firstname }}</td>
                      <td class="px-6 py-4 font-body text-[#c0c0c0] hidden md:table-cell">{{ formatDateDisplay(director.dob) }}</td>
                      <td class="px-6 py-4 text-right">
                        <div class="flex items-center justify-end gap-2">
                          <button @click="editDirector(director)" class="hover:cursor-pointer p-2 text-[#c0c0c0] hover:text-[#d4af37] transition-colors">
                            <Pencil class="w-4 h-4" />
                          </button>
                          <button @click="deleteDirector(director.id)" class="hover:cursor-pointer p-2 text-[#c0c0c0] hover:text-red-500 transition-colors">
                            <Trash2 class="w-4 h-4" />
                          </button>
                        </div>
                      </td>
                    </tr>
                    <tr v-if="directorsList.length === 0">
                      <td colspan="4" class="px-6 py-12 text-center text-[#c0c0c0] font-body">Aucun réalisateur trouvé.</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>

            <div class="xl:w-1/3 order-1 xl:order-2">
              <div class="sticky top-36 bg-[#12121a] border border-[#d4af37]/10 p-6">
                <div class="flex items-center justify-between mb-6 pb-4 border-b border-[#d4af37]/10">
                  <h3 class="font-display text-xl text-white flex items-center gap-2">
                    <Plus v-if="!directorForm.id" class="w-5 h-5 text-[#d4af37]" />
                    <Pencil v-else class="w-5 h-5 text-[#d4af37]" />
                    {{ directorForm.id ? 'Modifier' : 'Ajouter' }} un réalisateur
                  </h3>
                  <button v-if="directorForm.id" @click="resetDirectorForm" class="p-2 text-[#c0c0c0] hover:text-white transition-colors">
                    <X class="w-5 h-5" />
                  </button>
                </div>

                <form @submit.prevent="submitDirector" class="space-y-4">
                  <div class="grid grid-cols-2 gap-4">
                    <div>
                      <label class="block text-[#c0c0c0] text-xs uppercase tracking-wider mb-2 font-body">Prénom</label>
                      <input v-model="directorForm.firstname" required class="w-full px-4 py-3 bg-[#0a0a0c] border border-[#d4af37]/20 text-white font-body focus:border-[#d4af37] outline-none transition-colors" />
                    </div>
                    <div>
                      <label class="block text-[#c0c0c0] text-xs uppercase tracking-wider mb-2 font-body">Nom</label>
                      <input v-model="directorForm.lastname" required class="w-full px-4 py-3 bg-[#0a0a0c] border border-[#d4af37]/20 text-white font-body focus:border-[#d4af37] outline-none transition-colors" />
                    </div>
                  </div>
                  <div>
                    <label class="block text-[#c0c0c0] text-xs uppercase tracking-wider mb-2 font-body">Naissance</label>
                    <input v-model="directorForm.dob" type="date" class="w-full px-4 py-3 bg-[#0a0a0c] border border-[#d4af37]/20 text-white font-body focus:border-[#d4af37] outline-none transition-colors" />
                  </div>
                  <div>
                    <label class="block text-[#c0c0c0] text-xs uppercase tracking-wider mb-2 font-body">Décès</label>
                    <input v-model="directorForm.dod" type="date" class="w-full px-4 py-3 bg-[#0a0a0c] border border-[#d4af37]/20 text-white font-body focus:border-[#d4af37] outline-none transition-colors" />
                  </div>
                  <button type="submit" :disabled="submittingDirector" class="hover:cursor-pointer w-full py-4 mt-4 bg-gradient-to-r from-[#d4af37] to-[#a68a2a] text-[#0a0a0c] font-body font-semibold hover:brightness-110 transition-all duration-300 disabled:opacity-50">
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
.animate-fade-in {
  animation: fadeIn 0.3s ease-in-out;
}
@keyframes fadeIn {
  from { opacity: 0; transform: translateY(10px); }
  to { opacity: 1; transform: translateY(0); }
}
</style>
