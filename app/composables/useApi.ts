import { useAuthStore } from '~/stores/auth'

export const useApi = () => {
  const config = useRuntimeConfig()
  const auth = useAuthStore()

  const apiFetch = async <T>(endpoint: string, options: any = {}): Promise<T> => {
    const headers: Record<string, string> = {
      'Content-Type': 'application/ld+json',
      'Accept': 'application/ld+json',
      ...options.headers,
    }

    if (auth.token) {
      headers.Authorization = `Bearer ${auth.token}`
    }

    try {
      const data = await $fetch<T>(`${config.public.apiBase}${endpoint}`, {
        ...options,
        headers,
      })
      return data
    } catch (error) {
      console.error(`Erreur API ${endpoint}:`, error)
      throw error
    }
  }

  return {
    apiFetch,
  }
}
