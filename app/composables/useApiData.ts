export const useApiData = () => {
  const { apiFetch } = useApi()

  const fetchActors = async () => {
    return await apiFetch<{ 'hydra:member': any[] }>('/api/actors')
  }

  const fetchCategories = async () => {
    return await apiFetch<{ 'hydra:member': any[] }>('/api/categories')
  }

  const fetchDirectors = async () => {
    return await apiFetch<{ 'hydra:member': any[] }>('/api/directors')
  }

  const fetchMovies = async () => {
    return await apiFetch<{ 'hydra:member': any[] }>('/api/movies')
  }

  const fetchUsers = async () => {
    return await apiFetch<{ 'hydra:member': any[] }>('/api/users')
  }

  return {
    fetchActors,
    fetchCategories,
    fetchDirectors,
    fetchMovies,
    fetchUsers,
  }
}
