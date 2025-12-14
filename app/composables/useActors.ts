export const useActors = () => {
  const api = useApi()

  const getActors = async () => {
    return await api.get('/api/actors')
  }

  const getActor = async (id: number | string) => {
    return await api.get(`/api/actors/${id}`)
  }

  const createActor = async (actorData: any) => {
    return await api.post('/api/actors', actorData)
  }

  const updateActor = async (id: number | string, actorData: any) => {
    return await api.put(`/api/actors/${id}`, actorData)
  }

  const deleteActor = async (id: number | string) => {
    return await api.delete(`/api/actors/${id}`)
  }

  return {
    getActors,
    getActor,
    createActor,
    updateActor,
    deleteActor
  }
}
