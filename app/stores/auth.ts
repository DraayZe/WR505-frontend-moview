import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', {
    state: () => ({
        token: null as string | null,
        user: null as any,
        isLoading: false,
    }),

    getters: {
        isAuthenticated: (state) => !!state.token,
    },

    actions: {
        async login(email: string, password: string) {
            const config = useRuntimeConfig()
            this.isLoading = true

            try {
                const data = await $fetch<{ token: string }>(`${config.public.apiBase}/auth`, {
                    method: 'POST',
                    body: {
                        username: email,
                        password,
                    },
                })

                if (!data?.token) throw new Error('Token non reçu')

                this.token = data.token
                localStorage.setItem('token', this.token)

                await this.fetchUser()
            } catch (error) {
                console.error('Erreur de connexion:', error)
                throw new Error('Erreur de connexion')
            } finally {
                this.isLoading = false
            }
        },

        async register(email: string, password: string, name: string) {
            const config = useRuntimeConfig()
            this.isLoading = true

            try {
                await $fetch(`${config.public.apiBase}/api/users`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/ld+json',
                    },
                    body: {
                        email,
                        password,
                        name,
                    },
                })

                // Connexion automatique après inscription
                await this.login(email, password)
            } catch (error) {
                console.error('Erreur d\'inscription:', error)
                throw new Error('Erreur d\'inscription')
            } finally {
                this.isLoading = false
            }
        },

        async fetchUser() {
            if (!this.token) return

            const config = useRuntimeConfig()

            try {
                const data = await $fetch(`${config.public.apiBase}/api/me`, {
                    headers: {
                        Authorization: `Bearer ${this.token}`,
                    },
                })

                this.user = data
            } catch (error) {
                console.error('Impossible de récupérer le profil:', error)
                this.logout()
            }
        },

        logout() {
            this.token = null
            this.user = null
            localStorage.removeItem('token')
            navigateTo('/login')
        },

        loadFromStorage() {
            if (typeof window !== 'undefined') {
                const savedToken = localStorage.getItem('token')
                if (savedToken) {
                    this.token = savedToken
                    this.fetchUser()
                }
            }
        },
    },
})
