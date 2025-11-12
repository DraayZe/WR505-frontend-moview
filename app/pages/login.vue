<template>
  <div class="flex flex-col items-center justify-center min-h-screen bg-gray-50 p-4">
    <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
      <h1 class="text-3xl font-bold text-center mb-6">{{ isLogin ? 'Connexion' : 'Inscription' }}</h1>

      <form @submit.prevent="handleSubmit" class="flex flex-col gap-4">
        <div v-if="!isLogin">
          <label class="block text-sm font-medium text-gray-700 mb-1">Nom</label>
          <input
            v-model="name"
            type="text"
            placeholder="Votre nom"
            class="border border-gray-300 p-2 rounded w-full focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          />
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Email</label>
          <input
            v-model="email"
            type="email"
            placeholder="votre@email.com"
            class="border border-gray-300 p-2 rounded w-full focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          />
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Mot de passe</label>
          <input
            v-model="password"
            type="password"
            placeholder="••••••••"
            class="border border-gray-300 p-2 rounded w-full focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          />
        </div>

        <button
          type="submit"
          class="bg-blue-500 text-white p-3 rounded font-semibold hover:bg-blue-600 disabled:bg-gray-400 transition"
          :disabled="auth.isLoading"
        >
          {{ auth.isLoading ? 'Chargement...' : (isLogin ? 'Se connecter' : 'S\'inscrire') }}
        </button>
      </form>

      <p v-if="errorMsg" class="text-red-500 mt-4 text-center text-sm">{{ errorMsg }}</p>

      <div class="mt-6 text-center">
        <button
          @click="toggleMode"
          class="text-blue-500 hover:underline text-sm"
        >
          {{ isLogin ? 'Pas encore de compte ? Inscrivez-vous' : 'Déjà un compte ? Connectez-vous' }}
        </button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { useAuthStore } from '~/stores/auth'

definePageMeta({
  layout: false,
})

const auth = useAuthStore()
const email = ref('')
const password = ref('')
const name = ref('')
const errorMsg = ref('')
const isLogin = ref(true)

const toggleMode = () => {
  isLogin.value = !isLogin.value
  errorMsg.value = ''
}

async function handleSubmit() {
  errorMsg.value = ''

  try {
    if (isLogin.value) {
      await auth.login(email.value, password.value)
    } else {
      await auth.register(email.value, password.value, name.value)
    }
    navigateTo('/dashboard')
  } catch (err) {
    errorMsg.value = isLogin.value
      ? 'Identifiants incorrects.'
      : 'Erreur lors de l\'inscription. Veuillez réessayer.'
  }
}

onMounted(() => {
  if (auth.isAuthenticated) {
    navigateTo('/dashboard')
  }
})
</script>
