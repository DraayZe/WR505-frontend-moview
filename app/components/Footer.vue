<script setup lang="ts">
import { Film, Mail, Heart } from 'lucide-vue-next'
</script>

<template>
  <footer class="relative bg-[#0a0a0c] border-t border-[#d4af37]/10">
    <div class="absolute top-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[#d4af37]/30 to-transparent"></div>
    <div class="container mx-auto px-6 lg:px-12 py-16">
      <div class="grid grid-cols-1 md:grid-cols-3 gap-12 mb-16">
        <div>
          <NuxtLink to="/" class="group inline-flex items-center gap-3 mb-6">
            <span class="font-display text-2xl text-white group-hover:text-[#d4af37] transition-colors duration-300">
              Moview
            </span>
          </NuxtLink>
          <p class="font-body text-[#c0c0c0] text-sm leading-relaxed max-w-xs">
            Votre destination pour explorer l'univers du cinéma.
            Découvrez des films, acteurs et réalisateurs exceptionnels.
          </p>
        </div>

        <div>
          <h4 class="font-display text-white text-lg mb-6">Navigation</h4>
          <nav class="flex flex-col gap-3">
            <NuxtLink to="/movies"
              class="font-body text-[#c0c0c0] text-sm hover:text-[#d4af37] transition-colors duration-300 inline-flex items-center gap-2 group"
            >
              <span class="w-0 h-px bg-[#d4af37] group-hover:w-4 transition-all duration-300"></span>
              Films
            </NuxtLink>
            <NuxtLink to="/acteurs"
              class="font-body text-[#c0c0c0] text-sm hover:text-[#d4af37] transition-colors duration-300 inline-flex items-center gap-2 group"
            >
              <span class="w-0 h-px bg-[#d4af37] group-hover:w-4 transition-all duration-300"></span>
              Acteurs
            </NuxtLink>
            <NuxtLink to="/directeurs"
              class="font-body text-[#c0c0c0] text-sm hover:text-[#d4af37] transition-colors duration-300 inline-flex items-center gap-2 group"
            >
              <span class="w-0 h-px bg-[#d4af37] group-hover:w-4 transition-all duration-300"></span>
              Réalisateurs
            </NuxtLink>
          </nav>
        </div>

        <div>
          <h4 class="font-display text-white text-lg mb-6">Rejoignez-nous</h4>
          <p class="font-body text-[#c0c0c0] text-sm mb-6">
            Créez un compte pour partager vos avis et rejoindre notre communauté.
          </p>
          <NuxtLink to="/register"
            class="inline-flex items-center gap-2 px-4 py-2 rounded-xs border border-[#d4af37]/40 text-[#d4af37] font-body text-sm hover:bg-[#d4af37]/10 hover:border-[#d4af37] transition-all duration-300"
          >
            <Mail class="w-4 h-4" />
            S'inscrire
          </NuxtLink>
        </div>
      </div>

      <div class="h-px bg-gradient-to-r from-transparent via-[#d4af37]/20 to-transparent mb-8"></div>

      <div class="flex flex-col md:flex-row justify-between items-center gap-4">
        <div class="flex items-center gap-2 text-[#c0c0c0] text-xs font-body">
          <Film class="w-4 h-4 text-[#d4af37]" />
          <span>&copy; 2025 Moview. Tous droits réservés.</span>
        </div>

        <div class="flex items-center gap-2 text-[#c0c0c0] text-xs font-body">
          <span>Fait avec</span>
          <Heart class="w-3 h-3 text-[#d4af37] fill-[#d4af37]" />
          <span>pour les cinéphiles</span>
        </div>
      </div>
    </div>
  </footer>
</template>
