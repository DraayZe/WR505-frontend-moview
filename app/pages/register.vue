<script setup lang="ts">
import { Mail, Lock, ArrowRight, Film, Check, ShieldCheck } from 'lucide-vue-next'

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

const passwordStrength = computed(() => {
  const pwd = form.password
  if (!pwd) return 0
  let strength = 0
  if (pwd.length >= 6) strength++
  if (pwd.length >= 10) strength++
  if (/[A-Z]/.test(pwd)) strength++
  if (/[0-9]/.test(pwd)) strength++
  if (/[^A-Za-z0-9]/.test(pwd)) strength++
  return Math.min(strength, 4)
})

const strengthLabel = computed(() => {
  const labels = ['', 'Faible', 'Moyen', 'Bon', 'Excellent']
  return labels[passwordStrength.value]
})

const strengthColor = computed(() => {
  const colors = ['', 'bg-red-500', 'bg-orange-500', 'bg-yellow-500', 'bg-[#d4af37]']
  return colors[passwordStrength.value]
})
</script>

<template>
  <div class="min-h-screen flex bg-[#0a0a0c]">
    <div class="w-full lg:w-1/2 flex items-center justify-center p-8 lg:p-16">
      <div class="w-full max-w-md">
        <NuxtLink to="/" class="lg:hidden flex items-center gap-3 mb-12">
          <span class="font-display text-2xl text-white">Moview</span>
        </NuxtLink>

        <div class="mb-10">
          <span class="text-[#d4af37] text-sm tracking-[0.3em] uppercase font-body mb-4 block">Nouveau membre</span>
          <h1 class="font-display text-4xl lg:text-5xl text-white mb-4">
            Créer un compte
          </h1>
          <p class="font-body text-[#c0c0c0]">
            Rejoignez la communauté des cinéphiles
          </p>
        </div>

        <form @submit.prevent="handleRegister" class="space-y-6">
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
                placeholder="Minimum 6 caractères"
                class="w-full pl-12 pr-4 py-4 bg-[#12121a] border border-[#d4af37]/20 text-white placeholder-[#c0c0c0]/40 font-body focus:outline-none focus:border-[#d4af37] transition-colors duration-300"
              />
            </div>
            <div v-if="form.password" class="mt-3">
              <div class="flex gap-1 mb-2">
                <div
                  v-for="i in 4"
                  :key="i"
                  class="h-1 flex-1 rounded-full transition-colors duration-300"
                  :class="i <= passwordStrength ? strengthColor : 'bg-[#d4af37]/20'"
                ></div>
              </div>
              <p class="text-xs font-body" :class="passwordStrength >= 3 ? 'text-[#d4af37]' : 'text-[#c0c0c0]/60'">
                {{ strengthLabel }}
              </p>
            </div>
          </div>

          <div>
            <label for="confirmPassword" class="block text-sm text-[#c0c0c0] mb-3 font-body">
              Confirmer le mot de passe
            </label>
            <div class="relative">
              <ShieldCheck class="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-[#d4af37]/50" />
              <input
                id="confirmPassword"
                v-model="form.confirmPassword"
                type="password"
                required
                placeholder="••••••••"
                class="w-full pl-12 pr-4 py-4 bg-[#12121a] border border-[#d4af37]/20 text-white placeholder-[#c0c0c0]/40 font-body focus:outline-none focus:border-[#d4af37] transition-colors duration-300"
                :class="form.confirmPassword && form.password === form.confirmPassword ? 'border-[#d4af37]' : ''"
              />
              <Check
                v-if="form.confirmPassword && form.password === form.confirmPassword"
                class="absolute right-4 top-1/2 -translate-y-1/2 w-5 h-5 text-[#d4af37]"
              />
            </div>
          </div>

          <div
            v-if="error"
            class="p-4 bg-red-500/10 border border-red-500/30 text-red-400 text-sm font-body"
          >
            {{ error }}
          </div>

          <div
            v-if="success"
            class="p-4 bg-[#d4af37]/10 border border-[#d4af37]/30 text-[#d4af37] text-sm font-body flex items-center gap-3"
          >
            <Check class="w-5 h-5" />
            Compte créé avec succès ! Connexion en cours...
          </div>

          <button
            type="submit"
            :disabled="loading || success"
            class="hover:cursor-pointer group w-full py-4 bg-gradient-to-r from-[#d4af37] to-[#a68a2a] text-[#0a0a0c] font-body font-semibold flex items-center justify-center gap-3 hover:brightness-110 transition-all duration-300 disabled:opacity-50 disabled:cursor-not-allowed"
          >
            {{ loading ? 'Création en cours...' : 'Créer mon compte' }}
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
            to="/login"
            class="block font-body text-[#c0c0c0] hover:text-[#d4af37] transition-colors duration-300"
          >
            Déjà un compte ? <span class="text-[#d4af37]">Se connecter</span>
          </NuxtLink>
          <NuxtLink
            to="/"
            class="block font-body text-[#c0c0c0]/60 hover:text-[#c0c0c0] transition-colors duration-300 text-sm"
          >
            Continuer sans s'inscrire
          </NuxtLink>
        </div>
      </div>
    </div>

    <div class="hidden lg:flex lg:w-1/2 relative overflow-hidden">
      <div
        class="absolute inset-0 bg-cover bg-center"
        style="background-image: url('/images/oblivion.jpg');"
      ></div>

      <div class="absolute inset-0 bg-gradient-to-l from-[#0a0a0c] via-[#0a0a0c]/60 to-transparent"></div>
      <div class="absolute inset-0 bg-gradient-to-t from-[#0a0a0c] via-transparent to-[#0a0a0c]/30"></div>

      <div class="relative z-10 flex flex-col justify-between p-12 w-full">
        <div class="flex justify-end">
          <NuxtLink to="/" class="flex items-center gap-3">
            <span class="font-display text-2xl text-white">Moview</span>
          </NuxtLink>
        </div>

        <div class="max-w-sm ml-auto text-right">
          <div class="h-px w-16 bg-[#d4af37] mb-8 ml-auto"></div>
          <h3 class="font-display text-2xl text-white mb-6">Avantages membres</h3>
          <ul class="space-y-4">
            <li class="flex items-center gap-3 justify-end font-body text-[#c0c0c0]">
              <span>Donnez votre avis sur les films</span>
              <Check class="w-5 h-5 text-[#d4af37]" />
            </li>
            <li class="flex items-center gap-3 justify-end font-body text-[#c0c0c0]">
              <span>Créez votre liste de favoris</span>
              <Check class="w-5 h-5 text-[#d4af37]" />
            </li>
            <li class="flex items-center gap-3 justify-end font-body text-[#c0c0c0]">
              <span>Rejoignez la communauté</span>
              <Check class="w-5 h-5 text-[#d4af37]" />
            </li>
          </ul>
        </div>

        <div class="absolute bottom-12 left-12 w-24 h-24 border-l border-b border-[#d4af37]/30"></div>
      </div>
    </div>
  </div>
</template>
