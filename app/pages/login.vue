<script setup lang="ts">
import { Mail, Lock, ArrowRight, Film } from 'lucide-vue-next'

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
  <div class="min-h-screen flex bg-[#0a0a0c]">
    <div class="hidden lg:flex lg:w-1/2 relative overflow-hidden">
      <div
        class="absolute inset-0 bg-cover bg-center"
        style="background-image: url('/images/oblivion.jpg');"
      ></div>
      <div class="absolute inset-0 bg-gradient-to-r from-[#0a0a0c] via-[#0a0a0c]/60 to-transparent"></div>
      <div class="absolute inset-0 bg-gradient-to-t from-[#0a0a0c] via-transparent to-[#0a0a0c]/30"></div>
      <div class="relative z-10 flex flex-col justify-between p-12 w-full">
        <NuxtLink to="/" class="flex items-center gap-3">
          <span class="font-display text-2xl text-white">Moview</span>
        </NuxtLink>
        <div class="max-w-md">
          <div class="h-px w-16 bg-[#d4af37] mb-8"></div>
          <blockquote class="font-accent text-2xl text-white italic leading-relaxed mb-6">
            "Le cinéma, c'est l'écriture moderne dont l'encre est la lumière."
          </blockquote>
          <p class="font-body text-[#c0c0c0]">— Jean Cocteau</p>
        </div>

        <div class="absolute bottom-12 right-12 w-24 h-24 border-r border-b border-[#d4af37]/30"></div>
      </div>
    </div>

    <div class="w-full lg:w-1/2 flex items-center justify-center p-8 lg:p-16">
      <div class="w-full max-w-md">
        <NuxtLink to="/" class="lg:hidden flex items-center gap-3 mb-12">
          <span class="font-display text-2xl text-white">Moview</span>
        </NuxtLink>

        <div class="mb-10">
          <span class="text-[#d4af37] text-sm tracking-[0.3em] uppercase font-body mb-4 block">Bienvenue</span>
          <h1 class="font-display text-4xl lg:text-5xl text-white mb-4">
            Se connecter
          </h1>
          <p class="font-body text-[#c0c0c0]">
            Accédez à votre espace cinéma personnel
          </p>
        </div>

        <form @submit.prevent="handleLogin" class="space-y-6">
          <div>
            <label for="email" class="block text-sm text-[#c0c0c0] mb-3 font-body">
              Adresse email
            </label>
            <div class="relative">
              <Mail class="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-[#d4af37]/50" />
              <input
                id="email"
                v-model="form.email"
                type="email"
                required
                placeholder="votre@email.com"
                class="w-full pl-12 pr-4 py-4 bg-[#12121a] border border-[#d4af37]/20 text-white placeholder-[#c0c0c0]/40 font-body focus:outline-none focus:border-[#d4af37] transition-colors duration-300"
              />
            </div>
          </div>

          <div>
            <label for="password" class="block text-sm text-[#c0c0c0] mb-3 font-body">
              Mot de passe
            </label>
            <div class="relative">
              <Lock class="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-[#d4af37]/50" />
              <input
                id="password"
                v-model="form.password"
                type="password"
                required
                placeholder="••••••••"
                class="w-full pl-12 pr-4 py-4 bg-[#12121a] border border-[#d4af37]/20 text-white placeholder-[#c0c0c0]/40 font-body focus:outline-none focus:border-[#d4af37] transition-colors duration-300"
              />
            </div>
          </div>

          <div
            v-if="error"
            class="p-4 bg-red-500/10 border border-red-500/30 text-red-400 text-sm font-body"
          >
            {{ error }}
          </div>

          <button
            type="submit"
            :disabled="loading"
            class="hover:cursor-pointer group w-full py-4 bg-gradient-to-r from-[#d4af37] to-[#a68a2a] text-[#0a0a0c] font-body font-semibold flex items-center justify-center gap-3 hover:brightness-110 transition-all duration-300 disabled:opacity-50 disabled:cursor-not-allowed"
          >
            {{ loading ? 'Connexion en cours...' : 'Se connecter' }}
            <ArrowRight v-if="!loading" class="w-5 h-5 transition-transform group-hover:translate-x-1" />
          </button>
        </form>

        <div class="flex items-center gap-4 my-8">
          <div class="flex-1 h-px bg-[#d4af37]/20"></div>
          <span class="text-[#c0c0c0]/60 text-sm font-body">ou</span>
          <div class="flex-1 h-px bg-[#d4af37]/20"></div>
        </div>

        <div class="space-y-4 text-center">
          <NuxtLink
            to="/register"
            class="block font-body text-[#c0c0c0] hover:text-[#d4af37] transition-colors duration-300"
          >
            Pas encore de compte ? <span class="text-[#d4af37]">S'inscrire</span>
          </NuxtLink>
          <NuxtLink
            to="/"
            class="block font-body text-[#c0c0c0]/60 hover:text-[#c0c0c0] transition-colors duration-300 text-sm"
          >
            Continuer sans se connecter
          </NuxtLink>
        </div>
      </div>
    </div>
  </div>
</template>
