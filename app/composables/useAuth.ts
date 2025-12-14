export const useAuth = () => {
  const config = useRuntimeConfig()
  const token = useState<string | null>('auth_token', () => null)
  const user = useState<any>('auth_user', () => null)

  const login = async (email: string, password: string) => {
    try {
      const response = await $fetch<{ token: string }>(`${config.public.apiBase}/auth`, {
        method: 'POST',
        body: {
          email,
          password
        }
      })

      token.value = response.token
      user.value = { email }

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

  const logout = () => {
    token.value = null
    user.value = null

    if (import.meta.client) {
      localStorage.removeItem('auth_token')
      localStorage.removeItem('auth_user')
    }
  }

  const isAuthenticated = computed(() => !!token.value)

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
