export const useApi = () => {
  const config = useRuntimeConfig()
  const { token } = useAuth()

  // Fonction générique pour faire des appels API
  const apiFetch = async (endpoint: string, options: any = {}) => {
    const headers: any = {
      'Content-Type': 'application/json',
      ...options.headers
    }

    // Ajouter le token si disponible
    if (token.value) {
      headers['Authorization'] = `Bearer ${token.value}`
    }

    try {
      const response = await $fetch(`${config.public.apiBase}${endpoint}`, {
        ...options,
        headers
      })
      return { success: true, data: response }
    } catch (error: any) {
      console.error('Erreur API:', error)
      return {
        success: false,
        error: error.data?.message || 'Erreur lors de la requête'
      }
    }
  }

  // Méthodes raccourcies
  const get = (endpoint: string, options = {}) => {
    return apiFetch(endpoint, { method: 'GET', ...options })
  }

  const post = (endpoint: string, body: any, options = {}) => {
    return apiFetch(endpoint, { method: 'POST', body, ...options })
  }

  const put = (endpoint: string, body: any, options = {}) => {
    return apiFetch(endpoint, { method: 'PUT', body, ...options })
  }

  const del = (endpoint: string, options = {}) => {
    return apiFetch(endpoint, { method: 'DELETE', ...options })
  }

  return {
    apiFetch,
    get,
    post,
    put,
    delete: del
  }
}
