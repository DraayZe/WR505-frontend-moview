<script setup lang="ts">
const { createUser } = useUsers()
const { isAuthenticated, login } = useAuth()
const router = useRouter()

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

  // Étape 1 : Créer l'utilisateur
  const createResult = await createUser(userData)

  if (createResult.success) {
    success.value = true

    // Étape 2 : Connecter automatiquement l'utilisateur
    const loginResult = await login(form.email, form.password)

    if (loginResult.success) {
      // Redirection immédiate vers la page d'accueil
      router.push('/')
    } else {
      // Si la connexion échoue, rediriger vers la page de login
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
  <div class="min-h-screen flex items-center justify-center py-12 px-4">
    <div class="max-w-md w-full">
      <div class="text-center mb-8">
        <h2 class="text-3xl font-bold text-[#262620] mb-2">Inscription</h2>
        <p class="text-[#899878]">Créez votre compte</p>
      </div>

      <div class="bg-white border border-[#899878]/20 rounded-lg p-8">
        <form @submit.prevent="handleRegister" class="space-y-6">
          <div>
            <label for="email" class="block text-sm font-medium text-[#262620] mb-2">
              Email *
            </label>
            <input
              id="email"
              v-model="form.email"
              type="email"
              required
              class="w-full px-4 py-3 bg-[#e4e6c3] border border-[#899878]/20 rounded text-[#262620] focus:outline-none focus:border-[#899878] transition-colors"
            />
          </div>

          <div>
            <label for="password" class="block text-sm font-medium text-[#262620] mb-2">
              Mot de passe * (min. 6 caractères)
            </label>
            <input
              id="password"
              v-model="form.password"
              type="password"
              required
              class="w-full px-4 py-3 bg-[#e4e6c3] border border-[#899878]/20 rounded text-[#262620] focus:outline-none focus:border-[#899878] transition-colors"
            />
          </div>

          <div>
            <label for="confirmPassword" class="block text-sm font-medium text-[#262620] mb-2">
              Confirmer le mot de passe *
            </label>
            <input
              id="confirmPassword"
              v-model="form.confirmPassword"
              type="password"
              required
              class="w-full px-4 py-3 bg-[#e4e6c3] border border-[#899878]/20 rounded text-[#262620] focus:outline-none focus:border-[#899878] transition-colors"
            />
          </div>

          <div v-if="error" class="p-3 bg-red-100 border border-red-300 rounded text-red-700 text-sm">
            {{ error }}
          </div>

          <div v-if="success" class="p-3 bg-green-100 border border-green-300 rounded text-green-700 text-sm">
            Compte créé avec succès ! Connexion en cours...
          </div>

          <button
            type="submit"
            :disabled="loading || success"
            class="w-full bg-[#899878] text-white hover:cursor-pointer font-medium py-3 rounded hover:bg-[#899878]/80 transition-colors disabled:opacity-50"
          >
            {{ loading ? 'Création en cours...' : 'Créer mon compte' }}
          </button>
        </form>

        <div class="mt-6 text-center space-y-2">
          <NuxtLink to="/login" class="block text-sm text-[#899878] hover:text-[#262620] transition-colors">
            Déjà un compte ? Se connecter
          </NuxtLink>
          <NuxtLink to="/" class="block text-sm text-[#899878] hover:text-[#262620] transition-colors">
            ← Retour à l'accueil
          </NuxtLink>
        </div>
      </div>
    </div>
  </div>
</template>
