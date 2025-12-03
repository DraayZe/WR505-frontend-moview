export const useActors = () => {
  const api = useApi()

  // Récupérer tous les acteurs
  const getActors = async () => {
    return await api.get('/api/actors')
  }

  // Récupérer un acteur par ID
  const getActor = async (id: number | string) => {
    return await api.get(`/api/actors/${id}`)
  }

  // Créer un nouvel acteur
  const createActor = async (actorData: any) => {
    return await api.post('/api/actors', actorData)
  }

  // Mettre à jour un acteur
  const updateActor = async (id: number | string, actorData: any) => {
    return await api.put(`/api/actors/${id}`, actorData)
  }

  // Supprimer un acteur
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
