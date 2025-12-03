export const useMovies = () => {
  const api = useApi()

  // Récupérer tous les films
  const getMovies = async () => {
    return await api.get('/api/movies')
  }

  // Récupérer un film par ID
  const getMovie = async (id: number | string) => {
    return await api.get(`/api/movies/${id}`)
  }

  // Créer un nouveau film
  const createMovie = async (movieData: any) => {
    return await api.post('/api/movies', movieData)
  }

  // Mettre à jour un film
  const updateMovie = async (id: number | string, movieData: any) => {
    return await api.put(`/api/movies/${id}`, movieData)
  }

  // Supprimer un film
  const deleteMovie = async (id: number | string) => {
    return await api.delete(`/api/movies/${id}`)
  }

  return {
    getMovies,
    getMovie,
    createMovie,
    updateMovie,
    deleteMovie
  }
}
