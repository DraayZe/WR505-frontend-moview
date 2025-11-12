export default defineNuxtPlugin(() => {
  const auth = useAuthStore()

  // Charger le token depuis le localStorage au démarrage de l'application
  if (typeof window !== 'undefined') {
    auth.loadFromStorage()
  }
})
