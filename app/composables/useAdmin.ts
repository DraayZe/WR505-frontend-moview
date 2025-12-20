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
                movies { totalCount }
                actors { totalCount }
                directors { totalCount }
                categories { totalCount }
                reviews { totalCount }
            }
        `
        try {
            const { data } = await useAsyncGqlPulse<any>({
                client: 'backendapi',
                document: query,
            })
            return data.value
        } catch (error) {
            console.error('Erreur stats:', error)
            throw error
        }
    }

    const getMovies = async () => {
        const query = `
            query {
                movies(first: 500) {
                    edges {
                        node {
                            id
                            name
                            description
                            releaseData
                            duration
                            nbEntries
                            budget
                            director {
                                id
                                firstname
                                lastname
                            }
                        }
                    }
                }
            }
        `
        try {
            const response: any = await $fetch('http://localhost:8319/api/graphql', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ query })
            })
            console.log('Response getMovies:', response)
            return response?.data?.movies?.edges?.map((e: any) => e.node) || []
        } catch (error) {
            console.error('Erreur getMovies:', error)
            throw error
        }
    }

    const createMovie = async (movieData: any) => {
        let releaseDataISO = movieData.releaseData
        if (movieData.releaseData && !movieData.releaseData.includes('T')) {
            releaseDataISO = new Date(movieData.releaseData).toISOString()
        }

        const payload: any = {
            name: movieData.name,
            description: movieData.description,
            releaseData: releaseDataISO,
            duration: movieData.duration,
            image: movieData.image || '',
            nbEntries: movieData.nbEntries || 0,
            budget: movieData.budget || 0,
            url: movieData.url || '',
        }

        if (movieData.director) {
            const directorIri = movieData.director.toString().startsWith('/api/')
                ? movieData.director
                : `/api/directors/${movieData.director.toString().split('/').pop()}`
            payload.director = directorIri
        }

        return await $fetch(`${config.public.apiBase}/api/movies`, {
            method: 'POST',
            headers: getAuthHeaders(),
            body: payload,
        })
    }

    const updateMovie = async (id: string, movieData: any) => {
        let releaseDataISO = movieData.releaseData
        if (movieData.releaseData && !movieData.releaseData.includes('T')) {
            releaseDataISO = new Date(movieData.releaseData).toISOString()
        }

        const payload: any = {
            name: movieData.name,
            description: movieData.description,
            releaseData: releaseDataISO,
            duration: movieData.duration,
            image: movieData.image || '',
            nbEntries: movieData.nbEntries || 0,
            url: movieData.url || '',
            budget: movieData.budget || 0,
        }

        if (movieData.director) {
            const directorIri = movieData.director.toString().startsWith('/api/')
                ? movieData.director
                : `/api/directors/${movieData.director.toString().split('/').pop()}`
            payload.director = directorIri
        } else {
            payload.director = null
        }

        console.log('Payload UPDATE:', payload)

        const numericId = id.toString().split('/').pop()

        return await $fetch(`${config.public.apiBase}/api/movies/${numericId}`, {
            method: 'PUT',
            headers: getAuthHeaders(),
            body: payload,
        })
    }

    const deleteMovie = async (id: string) => {
        const numericId = id.toString().split('/').pop()
        return await $fetch(`${config.public.apiBase}/api/movies/${numericId}`, {
            method: 'DELETE',
            headers: getAuthHeaders(),
        })
    }

    const getActors = async () => {
        const query = `
            query {
                actors(first: 500) {
                    edges {
                        node {
                            id
                            firstname
                            lastname
                            dob
                            dod
                            bio
                        }
                    }
                }
            }
        `
        try {
            const response: any = await $fetch('http://localhost:8319/api/graphql', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ query })
            })
            return response?.data?.actors?.edges?.map((e: any) => e.node) || []
        } catch (error) {
            console.error('Erreur getActors:', error)
            throw error
        }
    }

    const createActor = async (actorData: any) => {
        const payload = { ...actorData }
        delete payload.id
        return await $fetch(`${config.public.apiBase}/api/actors`, {
            method: 'POST',
            headers: getAuthHeaders(),
            body: payload,
        })
    }

    const updateActor = async (id: string, actorData: any) => {
        const numericId = id.toString().split('/').pop()
        const payload = { ...actorData }
        delete payload.id
        return await $fetch(`${config.public.apiBase}/api/actors/${numericId}`, {
            method: 'PUT',
            headers: getAuthHeaders(),
            body: payload,
        })
    }

    const deleteActor = async (id: string) => {
        const numericId = id.toString().split('/').pop()
        return await $fetch(`${config.public.apiBase}/api/actors/${numericId}`, {
            method: 'DELETE',
            headers: getAuthHeaders(),
        })
    }

    const getDirectors = async () => {
        const query = `
            query {
                directors(first: 500) {
                    edges {
                        node {
                            id
                            firstname
                            lastname
                            dob
                            dod
                        }
                    }
                }
            }
        `
        try {
            const response: any = await $fetch('http://localhost:8319/api/graphql', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ query })
            })
            return response?.data?.directors?.edges?.map((e: any) => e.node) || []
        } catch (error) {
            console.error('Erreur getDirectors:', error)
            throw error
        }
    }

    const createDirector = async (directorData: any) => {
        const payload = { ...directorData }
        delete payload.id
        return await $fetch(`${config.public.apiBase}/api/directors`, {
            method: 'POST',
            headers: getAuthHeaders(),
            body: payload,
        })
    }

    const updateDirector = async (id: string, directorData: any) => {
        const numericId = id.toString().split('/').pop()
        const payload = { ...directorData }
        delete payload.id
        return await $fetch(`${config.public.apiBase}/api/directors/${numericId}`, {
            method: 'PUT',
            headers: getAuthHeaders(),
            body: payload,
        })
    }

    const deleteDirector = async (id: string) => {
        const numericId = id.toString().split('/').pop()
        return await $fetch(`${config.public.apiBase}/api/directors/${numericId}`, {
            method: 'DELETE',
            headers: getAuthHeaders(),
        })
    }

    // --- OTHERS ---
    const getCategories = async () => {
        // ... (votre code existant pour categories)
        return []
    }

    return {
        getStats,
        getMovies, createMovie, updateMovie, deleteMovie,
        getActors, createActor, updateActor, deleteActor,
        getDirectors, createDirector, updateDirector, deleteDirector,
        getCategories
    }
}