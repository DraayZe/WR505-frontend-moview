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
  <div class="min-h-screen flex items-center justify-center bg-[#13151d] relative overflow-hidden">

    <div class="absolute inset-0">
      <div class="absolute top-[-200px] left-[-200px] w-[600px] h-[600px] bg-[#f43a00]/20 rounded-full blur-[120px]"></div>
      <div class="absolute bottom-[-200px] right-[-200px] w-[600px] h-[600px] bg-[#252837]/80 rounded-full blur-[120px]"></div>
    </div>

    <div class="relative z-10 w-full max-w-md bg-[#1b1e29] border border-[#292d3e] rounded-2xl shadow-xl p-10">

      <div class="mb-8 text-center">
        <h2 class="text-5xl text-white font-display mb-3">
          Se connecter
        </h2>
        <p class="text-gray-400 font-body">
          Accédez à votre espace cinéma
        </p>
      </div>

      <form @submit.prevent="handleLogin" class="space-y-6">

        <div>
          <label for="email" class="block text-sm text-gray-300 mb-2 font-body">
            Email
          </label>
          <input
              id="email"
              v-model="form.email"
              type="email"
              required
              placeholder="votre@email.com"
              class="w-full px-4 py-3 bg-[#13151d] border border-[#292d3e]
                   rounded-lg text-white placeholder-gray-500
                   focus:outline-none focus:border-[#f43a00] font-body"
          />
        </div>

        <div>
          <label for="password" class="block text-sm text-gray-300 mb-2 font-body">
            Mot de passe
          </label>
          <input
              id="password"
              v-model="form.password"
              type="password"
              required
              placeholder="••••••••"
              class="w-full px-4 py-3 bg-[#13151d] border border-[#292d3e]
                   rounded-lg text-white placeholder-gray-500
                   focus:outline-none focus:border-[#f43a00] font-body"
          />
        </div>

        <div
            v-if="error"
            class="p-4 bg-red-500/10 border border-red-500/30
                 rounded-lg text-red-400 text-sm font-body"
        >
          {{ error }}
        </div>

        <button
            type="submit"
            :disabled="loading"
            class="w-full py-3 rounded-lg font-body font-semibold text-white
                 bg-gradient-to-r from-[#f43a00] to-[#b12f01]
                 hover:opacity-90 hover:cursor-pointer transition
                 disabled:opacity-50 disabled:cursor-not-allowed
                 shadow-lg shadow-[#f43a00]/20 "
        >
          {{ loading ? 'Connexion...' : 'Se connecter' }}
        </button>

      </form>

      <div class="mt-8 text-center space-y-2 text-sm">
        <NuxtLink
            to="/register"
            class="block font-body text-gray-400 hover:text-[#f43a00] transition"
        >
          Pas encore de compte ? S’inscrire
        </NuxtLink>
        <NuxtLink
            to="/"
            class="block font-body text-gray-500 hover:text-gray-300 transition"
        >
          Continuer sans se connecter →
        </NuxtLink>
      </div>

    </div>
  </div>
</template>

