export const useAdmin = () => {
    const config = useRuntimeConfig()
    const authStore = useAuth()

    const getAuthHeaders = () => ({
        'Authorization': `Bearer ${authStore.token.value}`,
        'Content-Type': 'application/ld+json',
        'Accept': 'application/ld+json',
    })

    const getStats = async () => {
        const query = `
            query {
                movies {
                    totalCount
                }
                actors {
                    totalCount
                }
                directors {
                    totalCount
                }
                categories {
                    totalCount
                }
            }
        `

        type StatsQuery = {
            movies: {
                totalCount: number
            }
            actors: {
                totalCount: number
            }
            directors: {
                totalCount: number
            }
            categories: {
                totalCount: number
            }
        }

        try {
            const { data } = await useAsyncGqlPulse<StatsQuery>({
                client: 'backendapi',
                document: query,
            })
            return data.value
        } catch (error) {
            console.error('Erreur lors de la récupération des stats:', error)
            throw error
        }
    }

    const createMovie = async (movieData: {
        name: string
        description: string
        releaseData: string
        duration: number
        image?: string
        nbEntries?: number
        url?: string
        budget?: number
        categories?: string[]
        actors?: string[]
        directors?: string[]
    }) => {
        try {
            let releaseDataISO = movieData.releaseData
            if (movieData.releaseData && !movieData.releaseData.includes('T')) {
                releaseDataISO = new Date(movieData.releaseData).toISOString()
            }

            const payload = {
                name: movieData.name,
                description: movieData.description,
                duration: movieData.duration,
                releaseData: releaseDataISO,
                image: movieData.image || '',
                nbEntries: movieData.nbEntries || 0,
                url: movieData.url || '',
                budget: movieData.budget || 0,
                ...(movieData.categories && { categories: movieData.categories }),
                ...(movieData.actors && { actors: movieData.actors }),
                ...(movieData.directors && { directors: movieData.directors }),
            }

            return await $fetch(`${config.public.apiBase}/api/movies`, {
                method: 'POST',
                headers: getAuthHeaders(),
                body: payload,
            })
        } catch (error) {
            console.error('Erreur lors de la création du film:', error)
            throw error
        }
    }

    const updateMovie = async (id: string, movieData: any) => {
        try {
            return await $fetch(`${config.public.apiBase}/api/movies/${id}`, {
                method: 'PUT',
                headers: getAuthHeaders(),
                body: movieData,
            })
        } catch (error) {
            console.error('Erreur lors de la mise à jour du film:', error)
            throw error
        }
    }

    const deleteMovie = async (id: string) => {
        try {
            return await $fetch(`${config.public.apiBase}/api/movies/${id}`, {
                method: 'DELETE',
                headers: getAuthHeaders(),
            })
        } catch (error) {
            console.error('Erreur lors de la suppression du film:', error)
            throw error
        }
    }

    const createActor = async (actorData: {
        firstname: string
        lastname: string
        dob?: string
        dod?: string
        bio:string
    }) => {
        try {
            return await $fetch(`${config.public.apiBase}/api/actors`, {
                method: 'POST',
                headers: getAuthHeaders(),
                body: actorData,
            })
        } catch (error) {
            console.error('Erreur lors de la création de l\'acteur:', error)
            throw error
        }
    }

    const updateActor = async (id: string, actorData: any) => {
        try {
            return await $fetch(`${config.public.apiBase}/api/actors/${id}`, {
                method: 'PUT',
                headers: getAuthHeaders(),
                body: actorData,
            })
        } catch (error) {
            console.error('Erreur lors de la mise à jour de l\'acteur:', error)
            throw error
        }
    }

    const deleteActor = async (id: string) => {
        try {
            return await $fetch(`${config.public.apiBase}/api/actors/${id}`, {
                method: 'DELETE',
                headers: getAuthHeaders(),
            })
        } catch (error) {
            console.error('Erreur lors de la suppression de l\'acteur:', error)
            throw error
        }
    }

    const createDirector = async (directorData: {
        firstName: string
        lastName: string
        birthDate?: string
        nationality?: string
    }) => {
        try {
            return await $fetch(`${config.public.apiBase}/api/directors`, {
                method: 'POST',
                headers: getAuthHeaders(),
                body: directorData,
            })
        } catch (error) {
            console.error('Erreur lors de la création du réalisateur:', error)
            throw error
        }
    }

    const updateDirector = async (id: string, directorData: any) => {
        try {
            return await $fetch(`${config.public.apiBase}/api/directors/${id}`, {
                method: 'PUT',
                headers: getAuthHeaders(),
                body: directorData,
            })
        } catch (error) {
            console.error('Erreur lors de la mise à jour du réalisateur:', error)
            throw error
        }
    }

    const deleteDirector = async (id: string) => {
        try {
            return await $fetch(`${config.public.apiBase}/api/directors/${id}`, {
                method: 'DELETE',
                headers: getAuthHeaders(),
            })
        } catch (error) {
            console.error('Erreur lors de la suppression du réalisateur:', error)
            throw error
        }
    }

    const getCategories = async () => {
        const query = `
            query {
                categories {
                    edges {
                        node {
                            id
                            name
                        }
                    }
                }
            }
        `

        type CategoriesQuery = {
            categories: {
                edges: {
                    node: {
                        id: string
                        name: string
                    }
                }[]
            }
        }

        try {
            const { data } = await useAsyncGqlPulse<CategoriesQuery>({
                client: 'backendapi',
                document: query,
            })
            return data.value?.categories?.edges || []
        } catch (error) {
            console.error('Erreur lors de la récupération des catégories:', error)
            throw error
        }
    }

    const getActors = async () => {
        const query = `
            query {
                actors {
                    edges {
                        node {
                            id
                            firstName
                            lastName
                        }
                    }
                }
            }
        `

        type ActorsQuery = {
            actors: {
                edges: {
                    node: {
                        id: string
                        firstName: string
                        lastName: string
                    }
                }[]
            }
        }

        try {
            const { data } = await useAsyncGqlPulse<ActorsQuery>({
                client: 'backendapi',
                document: query,
            })
            return data.value?.actors?.edges || []
        } catch (error) {
            console.error('Erreur lors de la récupération des acteurs:', error)
            throw error
        }
    }

    const getDirectors = async () => {
        const query = `
            query {
                directors {
                    edges {
                        node {
                            id
                            firstName
                            lastName
                        }
                    }
                }
            }
        `

        type DirectorsQuery = {
            directors: {
                edges: {
                    node: {
                        id: string
                        firstName: string
                        lastName: string
                    }
                }[]
            }
        }

        try {
            const { data } = await useAsyncGqlPulse<DirectorsQuery>({
                client: 'backendapi',
                document: query,
            })
            return data.value?.directors?.edges || []
        } catch (error) {
            console.error('Erreur lors de la récupération des réalisateurs:', error)
            throw error
        }
    }

    return {
        getStats,
        createMovie,
        updateMovie,
        deleteMovie,
        createActor,
        updateActor,
        deleteActor,
        createDirector,
        updateDirector,
        deleteDirector,
        getCategories,
        getActors,
        getDirectors,
    }
}
