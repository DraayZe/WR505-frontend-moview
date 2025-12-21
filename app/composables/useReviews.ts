export const useReviews = () => {
    const config = useRuntimeConfig()
    const auth = useAuth()

    const getAuthHeaders = () => ({
        'Authorization': `Bearer ${auth.token.value}`,
        'Content-Type': 'application/ld+json',
        'Accept': 'application/ld+json',
    })

    const getMovieReviews = async (movieIri: string) => {
        return await $fetch(
            `${config.public.apiBase}/api/reviews?movie=${movieIri}`,
            {
                headers: {
                    Accept: 'application/ld+json',
                },
            }
        )
    }



    console.log('Reviews API:', Response)

    const createReview = async (reviewData: {
        movie: string
        comment: string
        rating: number
    }) => {
        if (!auth.isAuthenticated.value) {
            throw new Error('Vous devez être connecté pour laisser un avis')
        }

        console.log('User data:', auth.user.value)
        const userId = auth.user.value?.['@id'] || auth.user.value?.id

        if (!userId) {
            console.error('User value:', auth.user.value)
            throw new Error('Impossible de récupérer les informations de l\'utilisateur. Vérifiez que /api/me retourne l\'ID de l\'utilisateur.')
        }

        try {
            const userIri = userId.toString().startsWith('/api/') ? userId : `/api/users/${userId}`

            const payload = {
                movie: reviewData.movie,
                user: userIri,
                comment: reviewData.comment,
                rating: reviewData.rating,
            }

            console.log('Payload envoyé:', payload)

            return await $fetch(`${config.public.apiBase}/api/reviews`, {
                method: 'POST',
                headers: getAuthHeaders(),
                body: payload,
            })
        } catch (error) {
            console.error('Erreur lors de la création de la review:', error)
            throw error
        }
    }

    const updateReview = async (reviewId: string, reviewData: {
        comment?: string
        rating?: number
    }) => {
        try {
            return await $fetch(`${config.public.apiBase}/api/reviews/${reviewId}`, {
                method: 'PUT',
                headers: getAuthHeaders(),
                body: reviewData,
            })
        } catch (error) {
            console.error('Erreur lors de la mise à jour de la review:', error)
            throw error
        }
    }

    const deleteReview = async (reviewId: string) => {
        try {
            return await $fetch(`${config.public.apiBase}/api/reviews/${reviewId}`, {
                method: 'DELETE',
                headers: getAuthHeaders(),
            })
        } catch (error) {
            console.error('Erreur lors de la suppression de la review:', error)
            throw error
        }
    }

    return {
        getMovieReviews,
        createReview,
        updateReview,
        deleteReview,
    }
}
