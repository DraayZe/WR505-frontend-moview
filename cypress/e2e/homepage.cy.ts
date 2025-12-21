describe('Page d\'accueil', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('devrait charger la page d\'accueil', () => {
    cy.contains('L\'univers du cinéma').should('be.visible')
  })

  it('devrait afficher le bouton "Parcourir les films"', () => {
    cy.contains('Parcourir les films').should('be.visible')
  })

  it('devrait afficher les 3 sections de fonctionnalités', () => {
    cy.contains('Explorez des milliers de films').should('be.visible')
    cy.contains('Donnez votre avis').should('be.visible')
    cy.contains('Découvrez les talents du cinéma').should('be.visible')
  })

  it('devrait afficher les informations de Forrest Gump', () => {
    cy.contains('Forrest Gump', { timeout: 10000 }).should('be.visible')
  })

  it('devrait naviguer vers la page films en cliquant sur le bouton', () => {
    cy.contains('Parcourir les films').click()
    cy.url().should('include', '/movies')
  })

  it('devrait afficher la section des avis', () => {
    cy.contains('Les avis de', { timeout: 10000 }).should('be.visible')
  })
})
