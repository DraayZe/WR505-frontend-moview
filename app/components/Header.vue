<script setup lang="ts">
const { isAuthenticated, user, isAdmin, logout, initAuth } = useAuth()
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
  <header
      class="hidden lg:block fixed top-0 inset-x-0 z-50
           bg-[#1b1e29]/80 backdrop-blur-md
           border-b border-[#292d3e]"
  >
    <div class="container mx-auto px-6 lg:px-12 py-4 flex items-center justify-between">

      <NuxtLink
          to="/"
          class="text-2xl font-body font-bold tracking-tight text-white hover:text-[#f43a00] transition-colors"
      >
        Moview
      </NuxtLink>

      <nav class="flex items-center gap-10 text-sm font-body">
        <NuxtLink
            to="/movies"
            class="relative text-white/80 hover:text-white transition
                 after:absolute after:left-0 after:-bottom-1
                 after:h-[2px] after:w-0 after:bg-[#f43a00]
                 hover:after:w-full after:transition-all"
        >
          Films
        </NuxtLink>

        <NuxtLink
            to="/acteurs"
            class="relative text-white/80 hover:text-white transition
                 after:absolute after:left-0 after:-bottom-1
                 after:h-[2px] after:w-0 after:bg-[#f43a00]
                 hover:after:w-full after:transition-all"
        >
          Acteurs
        </NuxtLink>

        <NuxtLink
            to="/directeurs"
            class="relative text-white/80 hover:text-white transition
                 after:absolute after:left-0 after:-bottom-1
                 after:h-[2px] after:w-0 after:bg-[#f43a00]
                 hover:after:w-full after:transition-all"
        >
          Réalisateurs
        </NuxtLink>
      </nav>

      <div>
        <DropdownMenu v-if="isAuthenticated">
          <DropdownMenuTrigger
              class="flex items-center gap-2 px-4 py-2
                   bg-gradient-to-r from-[#f43a00] to-[#b12f01]
                   rounded-lg text-sm text-white
                   hover:opacity-90 transition shadow-lg hover:cursor-pointer"
          >
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none"
                 viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
            </svg>
            Mon profil
          </DropdownMenuTrigger>

          <DropdownMenuContent
              class="w-56 bg-[#1b1e29] border border-[#292d3e] text-white"
          >
            <DropdownMenuLabel class="font-normal">
              <div class="flex flex-col space-y-1">
                <p class="text-sm font-medium">Mon compte</p>
                <p class="text-xs text-gray-400 truncate">
                  {{ user?.email }}
                </p>
              </div>
            </DropdownMenuLabel>

            <DropdownMenuSeparator class="bg-[#292d3e]" />

            <DropdownMenuItem
                v-if="isAdmin"
                @click="router.push('/admin')"
                class="cursor-pointer hover:bg-[#252837] focus:bg-[#252837]"
            >
              <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" fill="none"
                   viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"/>
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
              </svg>
              Administration
            </DropdownMenuItem>

            <DropdownMenuItem
                @click="handleLogout"
                class="cursor-pointer text-red-400 hover:text-red-300 focus:bg-[#252837]"
            >
              <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" fill="none"
                   viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"/>
              </svg>
              Se déconnecter
            </DropdownMenuItem>
          </DropdownMenuContent>
        </DropdownMenu>

        <NuxtLink
            v-else
            to="/login"
            class="px-5 py-2 bg-gradient-to-r from-[#f43a00] to-[#b12f01]
                 text-white font-body rounded-lg text-sm
                 hover:opacity-90 transition shadow-lg"
        >
          Se connecter
        </NuxtLink>
      </div>

    </div>
  </header>
</template>
