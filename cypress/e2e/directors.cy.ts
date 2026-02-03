describe('Page Réalisateurs', () => {
  beforeEach(() => {
    cy.visit('/directeurs')
  })

  it('devrait charger la page des réalisateurs', () => {
    cy.contains('Réalisateurs').should('be.visible')
    cy.contains('Découvrez les talents qui façonnent le 7ᵉ art').should('be.visible')
  })

  it('devrait afficher le nombre de réalisateurs disponibles', () => {
    cy.contains(/\d+ réalisateurs? disponibles?/).should('be.visible')
  })

  it('devrait afficher la barre de recherche', () => {
    cy.get('input[placeholder*="Rechercher un réalisateur"]').should('be.visible')
  })

  it('devrait afficher les cartes des réalisateurs', () => {
    cy.get('.grid', { timeout: 10000 }).should('be.visible')
  })

  it('devrait afficher les images des réalisateurs', () => {
    cy.get('img', { timeout: 10000 }).should('have.length.greaterThan', 0)
  })

  it('devrait avoir des cartes de réalisateurs', () => {
    cy.get('.group', { timeout: 10000 }).should('have.length.greaterThan', 0)
  })
})
