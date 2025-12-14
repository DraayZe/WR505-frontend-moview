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
  <div class="relative min-h-screen flex items-center justify-center py-12 px-4">
    <div class="fixed top-0 left-0 -z-10 h-full w-full bg-white">
      <div class="absolute bottom-auto left-auto right-0 top-0 h-[500px] w-[500px] -translate-x-[30%] translate-y-[20%] rounded-full bg-[rgba(16,185,129,0.5)] opacity-50 blur-[80px]"></div>
    </div>

    <div class="max-w-md w-120 relative z-10">
      <div class="mb-8">
        <h2 class="text-4xl text-black mb-3">Veuillez vous inscrire</h2>
        <p class="text-black/50">Entrez vos identifiants</p>
      </div>

      <div class="">
        <form @submit.prevent="handleRegister" class="space-y-6">
          <div>
            <label for="email" class="block text-sm text-black mb-2">
              Email *
            </label>
            <input id="email" v-model="form.email" type="email" required class="w-full px-4 py-3 bg-white rounded-lg text-black border border-black" placeholder="votre@email.com"/>
          </div>

          <div>
            <label for="password" class="block text-sm text-black mb-2">
              Mot de passe * (min. 6 caractères)
            </label>
            <input id="password" v-model="form.password" type="password" required class="w-full px-4 py-3 bg-white rounded-lg text-black border border-black" placeholder="••••••••"/>
          </div>

          <div>
            <label for="confirmPassword" class="block text-sm text-black mb-2">
              Confirmer le mot de passe *
            </label>
            <input id="confirmPassword" v-model="form.confirmPassword" type="password" required class="w-full px-4 py-3 bg-white rounded-lg text-black border border-black" placeholder="••••••••"/>
          </div>

          <div v-if="error" class="p-3 bg-red-50 border border-red-200 rounded-lg text-red-700 text-sm">
            {{ error }}
          </div>

          <div v-if="success" class="p-3 bg-emerald-50 border border-emerald-200 rounded-lg text-emerald-700 text-sm">
            Compte créé avec succès ! Connexion en cours...
          </div>

          <button
            type="submit"
            :disabled="loading || success"
            class="w-full bg-emerald-500 text-white hover:cursor-pointer py-3 rounded-lg hover:bg-emerald-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed shadow-lg"
          >
            {{ loading ? 'Création en cours...' : 'Créer mon compte' }}
          </button>
        </form>

        <div class="mt-6 text-center space-y-2">
          <NuxtLink to="/login" class="block text-sm text-emerald-500 hover:text-emerald-700 font-medium transition-colors">
            Déjà un compte ? Se connecter
          </NuxtLink>
          <NuxtLink to="/" class="block text-sm text-gray-500 hover:text-gray-700 transition-colors">
            Coninuer sans s'inscrire →
          </NuxtLink>
        </div>
      </div>
    </div>
  </div>
</template>
