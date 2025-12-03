<template>
  <div class="relative min-h-screen bg-[#e4e6c3]">
    <!-- Fond avec grille animée -->
    <div class="absolute inset-0 bg-[linear-gradient(to_right,#899878_1px,transparent_1px),linear-gradient(to_bottom,#899878_1px,transparent_1px)] bg-[size:14px_24px] [mask-image:radial-gradient(ellipse_80%_50%_at_50%_0%,#000_70%,transparent_110%)] opacity-20"></div>

    <!-- Contenu -->
    <div class="relative z-10">
      <Navbar />
      <NuxtPage />
    </div>
  </div>
</template>
