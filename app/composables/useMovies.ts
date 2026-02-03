export const useMovies = () => {
  const api = useApi()

  const getMovies = async () => {
    return await api.get('/api/movies')
  }

  const getMovie = async (id: number | string) => {
    return await api.get(`/api/movies/${id}`)
  }

  const createMovie = async (movieData: any) => {
    return await api.post('/api/movies', movieData)
  }

  const updateMovie = async (id: number | string, movieData: any) => {
    return await api.put(`/api/movies/${id}`, movieData)
  }

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
