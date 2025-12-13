export const useApi = () => {
  const config = useRuntimeConfig()
  const { token } = useAuth()

  const apiFetch = async <T = any>(endpoint: string, options: any = {}): Promise<{ success: true; data: T } | { success: false; error: string }> => {
    const headers: any = {
      'Content-Type': 'application/ld+json',
      'Accept': 'application/ld+json',
      ...options.headers
    }

    // Ajouter le token si disponible
    if (token.value) {
      headers['Authorization'] = `Bearer ${token.value}`
    }

    try {
      const response = await $fetch<T>(`${config.public.apiBase}${endpoint}`, {
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

  const get = <T = any>(endpoint: string, options = {}) => {
    return apiFetch<T>(endpoint, { method: 'GET', ...options })
  }

  const post = <T = any>(endpoint: string, body: any, options = {}) => {
    return apiFetch<T>(endpoint, { method: 'POST', body, ...options })
  }

  const put = <T = any>(endpoint: string, body: any, options = {}) => {
    return apiFetch<T>(endpoint, { method: 'PUT', body, ...options })
  }

  const del = <T = any>(endpoint: string, options = {}) => {
    return apiFetch<T>(endpoint, { method: 'DELETE', ...options })
  }

  return {
    apiFetch,
    get,
    post,
    put,
    delete: del
  }
}