<script setup lang="ts">
const { login, isAuthenticated } = useAuth()
const router = useRouter()

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
  <div class="min-h-screen flex items-center justify-center py-12 px-4">
    <div class="max-w-md w-full">
      <div class="text-center mb-8">
        <h2 class="text-3xl font-bold text-[#262620] mb-2">Connexion</h2>
        <p class="text-[#899878]">Accédez à votre compte</p>
      </div>

      <div class="bg-white border border-[#899878]/20 rounded-lg p-8">
        <form @submit.prevent="handleLogin" class="space-y-6">
          <div>
            <label for="email" class="block text-sm font-medium text-[#262620] mb-2">
              Email
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
              Mot de passe
            </label>
            <input
              id="password"
              v-model="form.password"
              type="password"
              required
              class="w-full px-4 py-3 bg-[#e4e6c3] border border-[#899878]/20 rounded text-[#262620] focus:outline-none focus:border-[#899878] transition-colors"
            />
          </div>

          <div v-if="error" class="p-3 bg-red-100 border border-red-300 rounded text-red-700 text-sm">
            {{ error }}
          </div>

          <button
            type="submit"
            :disabled="loading"
            class="w-full bg-[#899878] text-white hover:cursor-pointer font-medium py-3 rounded hover:bg-[#899878]/80 transition-colors disabled:opacity-50"
          >
            {{ loading ? 'Connexion...' : 'Se connecter' }}
          </button>
        </form>

        <div class="mt-6 text-center">
          <NuxtLink to="/" class="text-sm text-[#899878] hover:text-[#262620] transition-colors">
            ← Retour à l'accueil
          </NuxtLink>
        </div>
      </div>
    </div>
  </div>
</template>
