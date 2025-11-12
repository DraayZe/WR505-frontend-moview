export default defineNuxtRouteMiddleware((to, from) => {
  const auth = useAuthStore()

  // Charger le token depuis le localStorage si disponible
  if (typeof window !== 'undefined' && !auth.token) {
    auth.loadFromStorage()
  }

  // Si l'utilisateur n'est pas authentifié et tente d'accéder à une page protégée
  if (!auth.isAuthenticated && to.path !== '/login') {
    return navigateTo('/login')
  }

  // Si l'utilisateur est déjà authentifié et tente d'accéder à la page de login
  if (auth.isAuthenticated && to.path === '/login') {
    return navigateTo('/dashboard')
  }
})
