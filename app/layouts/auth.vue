<script setup lang="ts">

</script>

<template>
  <div class="min-h-screen">
    <div class="flex min-h-screen">

      <div class="fixed top-0 left-0 -z-10 h-full w-full bg-neutral-900">
        <div
            class="absolute right-0 top-0 h-[500px] w-[500px]
                 -translate-x-[30%] translate-y-[20%]
                 rounded-full bg-[rgba(16,185,129,0.4)]
                 opacity-50 blur-[80px]"
        />
      </div>

      <main class="flex-1 relative z-10 flex items-center justify-center">
        <NuxtPage />
      </main>

    </div>
  </div>
</template>


<style scoped>

</style>