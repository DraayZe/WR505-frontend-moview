<script setup lang="ts">
const { isAuthenticated, user, logout, initAuth } = useAuth()
const router = useRouter()

onMounted(() => {
  initAuth()
})

const handleLogout = () => {
  logout()
  router.push('/login')
}
</script>

<template>
  <nav class="bg-[#262620] border-b border-[#899878]/20">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex justify-between items-center h-16">
        <NuxtLink to="/" class="text-[#e4e6c3] font-bold text-xl hover:text-[#899878] transition-colors">
          MovieDB
        </NuxtLink>

        <div class="flex items-center gap-8">
          <NuxtLink
            v-if="isAuthenticated"
            to="/films"
            class="text-[#e4e6c3] hover:text-[#899878] transition-colors"
          >
            Films
          </NuxtLink>
          <NuxtLink
              v-if="isAuthenticated"
              to="/acteurs"
              class="text-[#e4e6c3] hover:text-[#899878] transition-colors"
          >
            Acteurs
          </NuxtLink>

          <div v-if="isAuthenticated" class="flex items-center gap-4">
            <span class="text-[#899878] text-sm">{{ user?.email }}</span>
            <button
              @click="handleLogout"
              class="px-4 py-2 bg-[#899878] text-white hover:cursor-pointer rounded hover:bg-[#899878]/80 transition-colors"
            >
              Déconnexion
            </button>
          </div>

          <NuxtLink
            v-else
            to="/login"
            class="px-4 py-2 bg-[#899878] text-[#e4e6c3] font-medium rounded hover:bg-[#899878]/80 transition-colors"
          >
            Connexion
          </NuxtLink>
        </div>
      </div>
    </div>
  </nav>
</template>
