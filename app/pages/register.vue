<script setup lang="ts">
const { createUser } = useUsers()
const { isAuthenticated, login } = useAuth()
const router = useRouter()

definePageMeta({
  layout: 'auth'
})

const form = reactive({
  email: '',
  password: '',
  confirmPassword: ''
})

const loading = ref(false)
const error = ref('')
const success = ref(false)

// Rediriger si déjà authentifié
watchEffect(() => {
  if (isAuthenticated.value) {
    router.push('/')
  }
})

const validateForm = () => {
  if (!form.email || !form.password) {
    error.value = 'Email et mot de passe sont obligatoires'
    return false
  }

  if (form.password.length < 6) {
    error.value = 'Le mot de passe doit contenir au moins 6 caractères'
    return false
  }

  if (form.password !== form.confirmPassword) {
    error.value = 'Les mots de passe ne correspondent pas'
    return false
  }

  return true
}

const handleRegister = async () => {
  loading.value = true
  error.value = ''
  success.value = false

  if (!validateForm()) {
    loading.value = false
    return
  }

  const userData = {
    email: form.email,
    password: form.password
  }

  const createResult = await createUser(userData)

  if (createResult.success) {
    success.value = true

    const loginResult = await login(form.email, form.password)

    if (loginResult.success) {
      router.push('/')
    } else {
      error.value = 'Compte créé mais erreur de connexion. Veuillez vous connecter manuellement.'
      setTimeout(() => {
        router.push('/login')
      }, 2000)
    }
  } else {
    error.value = createResult.error || 'Erreur lors de la création du compte'
  }

  loading.value = false
}
</script>

<template>
  <div class="min-h-screen flex items-center justify-center bg-[#13151d] relative overflow-hidden">

    <div class="absolute inset-0">
      <div class="absolute top-[-200px] right-[-200px] w-[600px] h-[600px] bg-[#f43a00]/20 rounded-full blur-[120px]"></div>
      <div class="absolute bottom-[-200px] left-[-200px] w-[600px] h-[600px] bg-[#252837]/80 rounded-full blur-[120px]"></div>
    </div>

    <div class="relative z-10 w-full max-w-md bg-[#1b1e29] border border-[#292d3e] rounded-2xl shadow-xl p-10">

      <div class="mb-8 text-center">
        <h2 class="text-5xl text-white font-display mb-3">
          Créer un compte
        </h2>
        <p class="text-gray-400 font-body">
          Rejoignez la communauté cinéma
        </p>
      </div>

      <form @submit.prevent="handleRegister" class="space-y-6">

        <div>
          <label for="email" class="block text-sm text-gray-300 font-body mb-2">
            Email *
          </label>
          <input
              id="email"
              v-model="form.email"
              type="email"
              required
              placeholder="votre@email.com"
              class="w-full px-4 py-3 bg-[#13151d] border border-[#292d3e]
                   rounded-lg text-white font-body placeholder-gray-500
                   focus:outline-none focus:border-[#f43a00]"
          />
        </div>

        <div>
          <label for="password" class="block text-sm text-gray-300 font-body mb-2">
            Mot de passe * (min. 6 caractères)
          </label>
          <input
              id="password"
              v-model="form.password"
              type="password"
              required
              placeholder="••••••••"
              class="w-full px-4 py-3 bg-[#13151d] border border-[#292d3e]
                   rounded-lg text-white font-body placeholder-gray-500
                   focus:outline-none focus:border-[#f43a00]"
          />
        </div>

        <div>
          <label for="confirmPassword" class="block text-sm text-gray-300 font-body mb-2">
            Confirmer le mot de passe *
          </label>
          <input
              id="confirmPassword"
              v-model="form.confirmPassword"
              type="password"
              required
              placeholder="••••••••"
              class="w-full px-4 py-3 bg-[#13151d] border border-[#292d3e]
                   rounded-lg text-white font-body placeholder-gray-500
                   focus:outline-none focus:border-[#f43a00]"
          />
        </div>

        <div
            v-if="error"
            class="p-4 bg-red-500/10 border border-red-500/30
                 rounded-lg text-red-400 text-sm font-body"
        >
          {{ error }}
        </div>

        <div
            v-if="success"
            class="p-4 bg-emerald-500/10 border border-emerald-500/30
                 rounded-lg text-emerald-400 text-sm font-body"
        >
          Compte créé avec succès ! Connexion en cours...
        </div>

        <button
            type="submit"
            :disabled="loading || success"
            class="w-full py-3 rounded-lg font-body font-semibold text-white
                 bg-gradient-to-r from-[#f43a00] to-[#b12f01]
                 hover:opacity-90 transition hover:cursor-pointer
                 disabled:opacity-50 disabled:cursor-not-allowed
                 shadow-lg shadow-[#f43a00]/20"
        >
          {{ loading ? 'Création du compte...' : 'Créer mon compte' }}
        </button>

      </form>

      <div class="mt-8 text-center space-y-2 text-sm">
        <NuxtLink
            to="/login"
            class="block text-gray-400 font-body hover:text-[#f43a00] transition"
        >
          Déjà un compte ? Se connecter
        </NuxtLink>
        <NuxtLink
            to="/"
            class="block text-gray-500 font-body hover:text-gray-300 transition"
        >
          Continuer sans s’inscrire →
        </NuxtLink>
      </div>

    </div>
  </div>
</template>

