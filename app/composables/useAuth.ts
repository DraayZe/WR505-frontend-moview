export const useAuth = () => {
  const config = useRuntimeConfig()
  const token = useState<string | null>('auth_token', () => null)
  const user = useState<any>('auth_user', () => null)

  // Login
  const login = async (email: string, password: string) => {
    try {
      const response = await $fetch<{ token: string }>(`${config.public.apiBase}/auth`, {
        method: 'POST',
        body: {
          email,
          password
        }
      })

      // L'API retourne juste { token: "..." }
      token.value = response.token
      user.value = { email }

      // Stocke le token et l'email dans localStorage pour persistence
      if (import.meta.client) {
        localStorage.setItem('auth_token', response.token)
        localStorage.setItem('auth_user', JSON.stringify({ email }))
      }

      return { success: true, data: response }
    } catch (error: any) {
      console.error('Erreur de connexion:', error)
      return {
        success: false,
        error: error.data?.message || 'Erreur de connexion'
      }
    }
  }

  // Logout
  const logout = () => {
    token.value = null
    user.value = null

    if (import.meta.client) {
      localStorage.removeItem('auth_token')
      localStorage.removeItem('auth_user')
    }
  }

  // Vérifier si l'utilisateur est authentifié
  const isAuthenticated = computed(() => !!token.value)

  // Initialiser le token depuis localStorage au chargement
  const initAuth = () => {
    if (import.meta.client) {
      const storedToken = localStorage.getItem('auth_token')
      const storedUser = localStorage.getItem('auth_user')

      if (storedToken) {
        token.value = storedToken
      }

      if (storedUser) {
        try {
          user.value = JSON.parse(storedUser)
        } catch (e) {
          console.error('Erreur lors du parsing de user:', e)
        }
      }
    }
  }

  return {
    token,
    user,
    login,
    logout,
    isAuthenticated,
    initAuth
  }
}
