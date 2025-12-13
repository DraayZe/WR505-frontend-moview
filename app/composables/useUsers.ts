export const useUsers = () => {
  const api = useApi()

  const getUsers = async () => {
    return await api.get('/api/users')
  }

  const getUser = async (id: number | string) => {
    return await api.get(`/api/users/${id}`)
  }

  // Créer un nouvel utilisateur (inscription)
  const createUser = async (userData: {
    email: string
    password: string
  }) => {
    // Essayer d'abord avec "password" directement
    const payload = {
      email: userData.email,
      password: userData.password
    }
    return await api.post('/api/users', payload)
  }

  // Mettre à jour un utilisateur
  const updateUser = async (id: number | string, userData: any) => {
    return await api.put(`/api/users/${id}`, userData)
  }

  // Supprimer un utilisateur
  const deleteUser = async (id: number | string) => {
    return await api.delete(`/api/users/${id}`)
  }

  return {
    getUsers,
    getUser,
    createUser,
    updateUser,
    deleteUser
  }
}
