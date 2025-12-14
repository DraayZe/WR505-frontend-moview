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

import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu'
</script>

<template>
  <div class="hidden lg:flex w-64 flex-col border-r border-black p-6 h-screen sticky top-0 backdrop-blur-sm">
    <h1 class="text-2xl font-bold mb-8 text-black">
      MoviesDB
    </h1>

    <nav class="flex flex-col space-y-2 text-sm">
      <NuxtLink to="/" class="text-black hover:text-emerald-700 transition-colors cursor-pointer">Films</NuxtLink>
      <NuxtLink to="/acteurs" class="text-black hover:text-emerald-700 transition-colors cursor-pointer">Acteurs</NuxtLink>
      <NuxtLink to="/directeurs" class="text-black hover:text-emerald-700 transition-colors cursor-pointer">Directeurs</NuxtLink>
    </nav>
    <div class="mt-auto">
      <DropdownMenu v-if="isAuthenticated">
        <DropdownMenuTrigger class="mt-6 w-full px-4 py-2 bg-white border border-gray-300 rounded-lg text-sm hover:bg-gray-50 transition cursor-pointer flex items-center justify-center gap-2 shadow-sm">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
          </svg>
          <span class="text-gray-900">Mon profil</span>
        </DropdownMenuTrigger>
        <DropdownMenuContent class="w-56">
          <DropdownMenuLabel class="font-normal">
            <div class="flex flex-col space-y-1">
              <p class="text-sm font-medium text-gray-900">Mon compte</p>
              <p class="text-xs text-gray-500 truncate">{{ user?.email }}</p>
            </div>
          </DropdownMenuLabel>
          <DropdownMenuSeparator />
          <DropdownMenuItem @click="handleLogout" class="text-red-600 focus:text-red-600 cursor-pointer">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
            </svg>
            Se déconnecter
          </DropdownMenuItem>
        </DropdownMenuContent>
      </DropdownMenu>
      <NuxtLink v-else to="/login" class="mt-6 w-full px-4 py-2 bg-emerald-500 text-white rounded-lg text-sm hover:bg-emerald-700 transition cursor-pointer flex items-center justify-center shadow-lg">
        Se connecter
      </NuxtLink>
    </div>
  </div>
</template>
