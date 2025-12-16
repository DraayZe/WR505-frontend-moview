<script setup lang="ts">
const reviews = [
  {
    id: 1,
    username: "CinePhil_88",
    date: "Septembre 2023",
    rating: "10/10",
    content: "Un thriller psychologique intense. Denis Villeneuve maîtrise la tension de bout en bout. À voir absolument !",
    active: false
  },
  {
    id: 2,
    username: "SarahConnor",
    date: "Octobre 2023",
    rating: "10/10",
    content: "Perfection !! Je n'ai pas les mots pour décrire la performance de Hugh Jackman. Un scénario spectaculaire.",
    active: false
  },
  {
    id: 3,
    username: "MovieMaster",
    date: "Septembre 12th",
    rating: "10/10",
    content: "Quelle claque. J'étais investi dans les personnages dès les 20 premières minutes. Et cette fin... Wow.",
    active: true // Cette carte sera mise en avant (couleur orange) comme sur ta capture
  },
  {
    id: 4,
    username: "Alex_Review",
    date: "Septembre 2023",
    rating: "09/10",
    content: "Gripping! C'est comme ça qu'on commence un film. Des personnages profonds et une intrigue qui vous happe.",
    active: false
  }
];

</script>

<template>

  <div class="relative h-[calc(100vh-64px)] bg-gradient-to-br from-[#1b1e29] via-[#252837] to-[#1b1e29] overflow-hidden ">
    <div class="relative z-10 flex items-center h-full ">
      <div class="container mx-auto px-6 lg:px-12">
        <div class="max-w-2xl">
          <h1 class="text-5xl lg:text-7xl text-white mb-6 leading-tight font-display">
           L'univers du cinéma
          </h1>
          <p class="text-xl text-gray-300 mb-10 leading-relaxed font-body">
            Explorez notre collection complète de films, acteurs, réalisateurs et donnez votre avis.
          </p>
          <div class="flex flex-wrap gap-4">
            <NuxtLink to="/movies" class="font-body px-8 py-4 bg-gradient-to-r from-[#f43a00] to-[#b12f01] text-white rounded-lg font-medium hover:opacity-90 transition shadow-lg inline-flex items-center gap-2">
              Parcourir les films
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6" />
              </svg>
            </NuxtLink>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="bg-[#13151d] py-24 border-t border-[#292d3e]">
    <div class="container mx-auto px-6 lg:px-12">

      <div class="max-w-2xl mb-16">
        <h2 class="text-4xl text-white font-body mb-4">
          Que pouvez-vous faire sur L’univers du cinéma ?
        </h2>
        <p class="text-gray-400 text-lg font-body">
          Une plateforme pensée pour les passionnés de cinéma, du simple spectateur au cinéphile averti.
        </p>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">

        <div class="bg-[#1b1e29] border border-[#292d3e] rounded-xl p-8 hover:border-[#f43a00] transition">
          <div class="text-[#f43a00] mb-4">
            🎞️
          </div>
          <h3 class="text-xl text-white font-body mb-3">
            Explorez des milliers de films
          </h3>
          <p class="text-gray-400 font-body leading-relaxed">
            Parcourez une vaste base de données de films, des classiques intemporels aux dernières sorties.
          </p>
        </div>

        <div class="bg-[#1b1e29] border border-[#292d3e] rounded-xl p-8 hover:border-[#f43a00] transition">
          <div class="text-[#f43a00] mb-4">
            ⭐
          </div>
          <h3 class="text-xl text-white font-body mb-3">
            Donnez votre avis
          </h3>
          <p class="text-gray-400 font-body leading-relaxed">
            Notez les films, partagez vos critiques et découvrez l’opinion de la communauté.
          </p>
        </div>

        <div class="bg-[#1b1e29] border border-[#292d3e] rounded-xl p-8 hover:border-[#f43a00] transition">
          <div class="text-[#f43a00] mb-4">
            🎬
          </div>
          <h3 class="text-xl text-white font-body mb-3">
            Découvrez les talents du cinéma
          </h3>
          <p class="text-gray-400 font-body leading-relaxed">
            Explorez les fiches des acteurs, réalisateurs et équipes qui font vivre le 7ᵉ art.
          </p>
        </div>

      </div>
    </div>
  </div>


  <div class="relative w-full h-[1000px] overflow-hidden group">
    <div
        class="absolute inset-0 bg-cover bg-center"
        style="background-image: url('/images/oblivion.jpg');"
    ></div>

    <div class="absolute inset-0 bg-gradient-to-t from-[#1b1e29] via-[#1b1e29]/60 to-transparent"></div>

    <div class="relative z-10 container mx-auto px-6 lg:px-12 h-full flex flex-col justify-end pb-20">
      <h2 class="text-5xl lg:text-7xl font-bold text-white mb-4">Oblivion</h2>

      <p class="text-gray-200 text-lg max-w-2xl mb-8 leading-relaxed shadow-black drop-shadow-md">
        Lorsque la fille de Keller Dover et sa meilleure amie sont kidnappées, la panique s'installe.
        L'inspecteur Loki arrête le seul suspect, mais doit le relâcher faute de preuves.
        Jusqu'où irez-vous pour protéger votre famille ?
      </p>

      <div class="flex gap-4">
        <button class="px-8 py-3 bg-[#f43a00] text-white font-bold rounded hover:bg-[#b12f01] hover:cursor-pointer transition flex items-center gap-2">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM9.555 7.168A1 1 0 008 8v4a1 1 0 001.555.832l3-2a1 1 0 000-1.664l-3-2z" clip-rule="evenodd" /></svg>
          Voir le film
        </button>

      </div>
    </div>
  </div>

  <div class="bg-[#1b1e29] py-20 relative">
    <div class="text-center mb-12">
      <h2 class="text-3xl lg:text-4xl font-body text-white">Les avis d'Oblivion</h2>
    </div>

    <div class="container mx-auto px-6 lg:px-12">
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">

        <div v-for="review in reviews" :key="review.id"
             :class="[
               'p-6 rounded-lg border flex flex-col h-full transition-transform hover:-translate-y-1',
               review.active
                 ? 'bg-[#f43a00] border-[#f43a00] text-white shadow-lg shadow-orange-500/20'
                 : 'bg-transparent border-[#292d3e] text-gray-300 hover:border-gray-500'
             ]">

          <div class="flex items-center gap-3 mb-4">
            <div class="w-10 h-10 rounded-full bg-gray-600 overflow-hidden">
              <img :src="`https://api.dicebear.com/7.x/avataaars/svg?seed=${review.username}`" alt="avatar" />
            </div>
            <div>
              <div class="font-bold text-sm" :class="review.active ? 'text-white' : 'text-white'">{{ review.username }}</div>
              <div class="text-xs opacity-70">{{ review.date }}</div>
            </div>
          </div>

          <div class="text-xl font-bold mb-3" :class="review.active ? 'text-white' : 'text-white'">
            {{ review.rating }}
          </div>

          <p class="text-sm leading-relaxed mb-4 flex-grow" :class="review.active ? 'text-white/90' : 'text-gray-400'">
            {{ review.content }}
          </p>

          <a href="#" class="text-xs font-bold uppercase tracking-wider flex items-center gap-1 hover:underline mt-auto">
            Lire plus <span>→</span>
          </a>
        </div>

      </div>

      <div class="flex justify-center gap-2 mt-10">
        <div class="w-2 h-2 rounded-full bg-gray-600"></div>
        <div class="w-2 h-2 rounded-full bg-[#f43a00]"></div> <div class="w-2 h-2 rounded-full bg-gray-600"></div>
        <div class="w-2 h-2 rounded-full bg-gray-600"></div>
      </div>
    </div>
  </div>
</template>

<style scoped>

</style>