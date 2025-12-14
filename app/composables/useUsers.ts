export const useUsers = () => {
  const api = useApi()

  const getUsers = async () => {
    return await api.get('/api/users')
  }

  const getUser = async (id: number | string) => {
    return await api.get(`/api/users/${id}`)
  }

  const createUser = async (userData: {
    email: string
    password: string
  }) => {
    const payload = {
      email: userData.email,
      password: userData.password
    }
    return await api.post('/api/users', payload)
  }

  const updateUser = async (id: number | string, userData: any) => {
    return await api.put(`/api/users/${id}`, userData)
  }

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
