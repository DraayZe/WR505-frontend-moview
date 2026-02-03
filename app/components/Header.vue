<script setup lang="ts">
import { User, LogOut, Settings, ChevronDown } from 'lucide-vue-next'

const { isAuthenticated, user, isAdmin, logout, initAuth } = useAuth()
const router = useRouter()
const scrolled = ref(false)

onMounted(() => {
  initAuth()
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})

const handleScroll = () => {
  scrolled.value = window.scrollY > 50
}

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
  <header
    :class="[
      'hidden lg:block fixed top-0 inset-x-0 z-50 transition-all duration-500',
      scrolled
        ? 'bg-[#0a0a0c]/95 backdrop-blur-md border-b border-[#d4af37]/10'
        : 'bg-transparent border-b border-transparent'
    ]"
  >
    <div class="container mx-auto px-6 lg:px-12 h-[66px] flex items-center justify-between">
      <NuxtLink
        to="/"
        class="group flex items-center gap-3"
      >
        <span class="font-display text-2xl tracking-tight text-white group-hover:text-[#d4af37] transition-colors duration-300">
          Moview
        </span>
        <span class="h-4 w-px bg-[#d4af37]/30"></span>
        <span class="text-xs text-[#c0c0c0] tracking-[0.2em] uppercase font-body hidden xl:block">
          L'Univers du Cinéma
        </span>
      </NuxtLink>

      <nav class="flex items-center gap-12 text-sm font-body">
        <NuxtLink
          to="/movies"
          class="relative text-[#c0c0c0] hover:text-white transition-colors duration-300 tracking-wide group"
        >
          <span>Films</span>
          <span class="absolute -bottom-1 left-0 w-0 h-px bg-gradient-to-r from-[#d4af37] to-[#f4e4a6] group-hover:w-full transition-all duration-300"></span>
        </NuxtLink>

        <NuxtLink
          to="/acteurs"
          class="relative text-[#c0c0c0] hover:text-white transition-colors duration-300 tracking-wide group"
        >
          <span>Acteurs</span>
          <span class="absolute -bottom-1 left-0 w-0 h-px bg-gradient-to-r from-[#d4af37] to-[#f4e4a6] group-hover:w-full transition-all duration-300"></span>
        </NuxtLink>

        <NuxtLink
          to="/directeurs"
          class="relative text-[#c0c0c0] hover:text-white transition-colors duration-300 tracking-wide group"
        >
          <span>Réalisateurs</span>
          <span class="absolute -bottom-1 left-0 w-0 h-px bg-gradient-to-r from-[#d4af37] to-[#f4e4a6] group-hover:w-full transition-all duration-300"></span>
        </NuxtLink>
      </nav>

      <div>
        <DropdownMenu v-if="isAuthenticated">
          <DropdownMenuTrigger
            class="group flex items-center gap-3 px-5 py-2.5 text-sm text-white transition-all duration-300 cursor-pointer"
          >
            <div class="w-8 h-8 rounded-full bg-gradient-to-br from-[#d4af37] to-[#a68a2a] flex items-center justify-center">
              <span class="text-[#0a0a0c] font-display font-bold text-sm">
                {{ user?.email?.[0]?.toUpperCase() || 'U' }}
              </span>
            </div>
            <span class="font-body">Mon profil</span>
            <ChevronDown class="w-4 h-4 text-[#d4af37]/60 group-hover:text-[#d4af37] transition-colors duration-300" />
          </DropdownMenuTrigger>

          <DropdownMenuContent
            class="w-64 bg-[#12121a] border border-[#d4af37]/20 text-white mt-2 p-2"
          >
            <DropdownMenuLabel class="font-normal px-3 py-3">
              <div class="flex flex-col space-y-1">
                <p class="text-sm font-display text-white">Mon compte</p>
                <p class="text-xs text-[#c0c0c0] truncate font-body">
                  {{ user?.email }}
                </p>
              </div>
            </DropdownMenuLabel>

            <DropdownMenuSeparator class="bg-[#d4af37]/10 my-2" />

            <DropdownMenuItem
              v-if="isAdmin"
              @click="router.push('/admin')"
              class="cursor-pointer px-3 py-2.5 hover:bg-[#d4af37]/10 focus:bg-[#d4af37]/10 rounded-sm transition-colors duration-200 font-body"
            >
              <Settings class="h-4 w-4 mr-3 text-[#d4af37]" />
              <span>Administration</span>
            </DropdownMenuItem>

            <DropdownMenuItem
              @click="handleLogout"
              class="cursor-pointer px-3 py-2.5 text-red-400 hover:text-red-300 hover:bg-red-500/10 focus:bg-red-500/10 rounded-sm transition-colors duration-200 font-body"
            >
              <LogOut class="h-4 w-4 mr-3" />
              <span>Se déconnecter</span>
            </DropdownMenuItem>
          </DropdownMenuContent>
        </DropdownMenu>

        <NuxtLink
          v-else
          to="/login"
          class="group flex items-center gap-2 px-4 py-2 rounded-xs bg-gradient-to-r from-[#d4af37] to-[#a68a2a] text-[#0a0a0c] font-body font-medium text-sm hover:brightness-110 transition-all duration-300"
        >
          <User class="w-4 h-4" />
          Se connecter
        </NuxtLink>
      </div>
    </div>
  </header>

  <header
    :class="[
      'lg:hidden fixed top-0 inset-x-0 z-50 transition-all duration-500',
      scrolled
        ? 'bg-[#0a0a0c]/95 backdrop-blur-md border-b border-[#d4af37]/10'
        : 'bg-transparent border-b border-transparent'
    ]"
  >
    <div class="container mx-auto px-4 h-[64px] flex items-center justify-between">
      <NuxtLink to="/" class="font-display text-xl text-white">
        Moview
      </NuxtLink>

      <NuxtLink
        v-if="!isAuthenticated"
        to="/login"
        class="px-4 py-2 bg-gradient-to-r from-[#d4af37] to-[#a68a2a] text-[#0a0a0c] font-body font-medium text-sm"
      >
        Connexion
      </NuxtLink>

      <DropdownMenu v-else>
        <DropdownMenuTrigger class="p-2">
          <div class="w-8 h-8 rounded-full bg-gradient-to-br from-[#d4af37] to-[#a68a2a] flex items-center justify-center">
            <span class="text-[#0a0a0c] font-display font-bold text-sm">
              {{ user?.email?.[0]?.toUpperCase() || 'U' }}
            </span>
          </div>
        </DropdownMenuTrigger>

        <DropdownMenuContent class="w-56 bg-[#12121a] border border-[#d4af37]/20 text-white mr-4">
          <DropdownMenuItem @click="router.push('/movies')" class="cursor-pointer hover:bg-[#d4af37]/10">
            Films
          </DropdownMenuItem>
          <DropdownMenuItem @click="router.push('/acteurs')" class="cursor-pointer hover:bg-[#d4af37]/10">
            Acteurs
          </DropdownMenuItem>
          <DropdownMenuItem @click="router.push('/directeurs')" class="cursor-pointer hover:bg-[#d4af37]/10">
            Réalisateurs
          </DropdownMenuItem>
          <DropdownMenuSeparator class="bg-[#d4af37]/10" />
          <DropdownMenuItem v-if="isAdmin" @click="router.push('/admin')" class="cursor-pointer hover:bg-[#d4af37]/10">
            Administration
          </DropdownMenuItem>
          <DropdownMenuItem @click="handleLogout" class="cursor-pointer text-red-400 hover:bg-red-500/10">
            Se déconnecter
          </DropdownMenuItem>
        </DropdownMenuContent>
      </DropdownMenu>
    </div>
  </header>
</template>
