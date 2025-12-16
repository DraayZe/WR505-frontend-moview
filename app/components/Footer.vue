<script setup lang="ts">

</script>

<template>
    <footer class="bg-[#12141c] pt-16 pb-8 border-t border-[#292d3e]">
      <div class="container mx-auto px-6 lg:px-12">
        <div class="flex flex-col md:flex-row justify-between items-start gap-10 mb-10">

          <div class="flex gap-8 text-gray-400 text-sm font-medium">
            <NuxtLink to="/movies" class="hover:text-[#f43a00]">Films</NuxtLink>
            <NuxtLink to="/acteurs" class="hover:text-[#f43a00]">Acteurs</NuxtLink>
            <NuxtLink to="/directeurs" class="hover:text-[#f43a00]">Directeurs</NuxtLink>
          </div>
        </div>

        <div class="flex flex-col md:flex-row justify-between items-center text-gray-600 text-xs mt-10">
          <div class="flex items-center gap-4 mb-4 md:mb-0">
            <NuxtLink to="/" class="font-bold text-white text-lg tracking-tighter hover:text-[#f43a00] hover:cursor-pointer">Moview</NuxtLink>
          </div>
          <div class="text-gray-400">&copy; 2025 Tous droits réservés</div>
        </div>
      </div>
    </footer>
</template>

<style scoped>

</style>