<script setup lang="ts">
const { login, isAuthenticated } = useAuth()
const router = useRouter()

definePageMeta({
  layout: 'auth'
})

const form = reactive({
  email: '',
  password: ''
})

const loading = ref(false)
const error = ref('')

// Rediriger si déjà authentifié
watchEffect(() => {
  if (isAuthenticated.value) {
    router.push('/')
  }
})

const handleLogin = async () => {
  loading.value = true
  error.value = ''

  const result = await login(form.email, form.password)

  if (result.success) {
    router.push('/')
  } else {
    error.value = result.error
  }

  loading.value = false
}
</script>

<template>
  <div class="relative min-h-screen flex items-center justify-center">
    <div class="fixed top-0 left-0 -z-10 h-full w-full bg-white">
      <div class="absolute bottom-auto left-auto right-0 top-0 h-[500px] w-[500px] -translate-x-[30%] translate-y-[20%] rounded-full bg-[rgba(16,185,129,0.5)] opacity-50 blur-[80px]"></div>
    </div>

    <div class="max-w-md w-120 relative z-10">
      <div class="mb-8">
        <h2 class="text-4xl text-black mb-3">Veuillez vous connectez</h2>
        <p class="text-black/50">Entrez vos identifiants</p>
      </div>

      <div class="">
        <form @submit.prevent="handleLogin" class="space-y-6">
          <div>
            <label for="email" class="block text-sm text-gray-900 mb-2">
              Email
            </label>
            <input id="email" v-model="form.email" type="email" required class="w-full px-4 py-3 bg-white rounded-lg text-black border border-black" placeholder="votre@email.com"/>
          </div>

          <div>
            <label for="password" class="block text-sm text-gray-900 mb-2">
              Mot de passe
            </label>
            <input id="password" v-model="form.password" type="password" required class="w-full px-4 py-3 bg-white rounded-lg text-black border border-black" placeholder="••••••••"/>
          </div>

          <div v-if="error" class="p-3 bg-red-50 border border-red-200 rounded-lg text-red-700 text-sm">
            {{ error }}
          </div>

          <button type="submit" :disabled="loading" class="w-full bg-emerald-500 text-white hover:cursor-pointer py-3 rounded-lg hover:bg-emerald-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed shadow-lg">
            {{ loading ? 'Connexion...' : 'Se connecter' }}
          </button>
        </form>

        <div class="mt-6 text-center space-y-2">
          <NuxtLink to="/register" class="block text-sm text-emerald-500 hover:text-emerald-700 transition-colors">
            Pas encore de compte ? S'inscrire
          </NuxtLink>
        </div>
      </div>
    </div>
  </div>
</template>
