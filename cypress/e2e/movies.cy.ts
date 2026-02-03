describe('Page Films', () => {
  beforeEach(() => {
    cy.visit('/movies')
  })

  it('devrait charger la page des films', () => {
    cy.contains('Catalogue de films').should('be.visible')
  })

  it('devrait afficher le nombre de films disponibles', () => {
    cy.contains(/\d+ films? disponibles?/).should('be.visible')
  })

  it('devrait afficher le filtre par catégorie', () => {
    cy.get('button').contains('Toutes les catégories').should('be.visible')
  })

  it('devrait afficher la barre de recherche', () => {
    cy.get('input[placeholder*="Rechercher un film"]').should('be.visible')
  })

  it('devrait filtrer les films avec la recherche', () => {
    cy.get('input[placeholder*="Rechercher un film"]').type('Forrest')
    cy.contains('Forrest Gump', { timeout: 5000 }).should('be.visible')
  })

  it('devrait cliquer sur un film et naviguer vers sa page détail', () => {
    // Attendre que les films soient chargés
    cy.get('a[href*="/movies/"]', { timeout: 10000 }).first().click()
    cy.url().should('match', /\/movies\/\d+/)
  })
})
