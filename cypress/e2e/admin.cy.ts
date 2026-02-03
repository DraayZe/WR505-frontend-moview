describe('Interface d\'administration', () => {
  it('devrait rediriger vers /login si non connecté', () => {
    // Assurer qu'on n'est pas connecté
    cy.clearAllCookies()
    cy.clearAllLocalStorage()
    cy.clearAllSessionStorage()

    cy.visit('/admin')
    cy.url({ timeout: 5000 }).should('include', '/login')
  })

  it('devrait afficher la page de connexion avec le bon texte', () => {
    cy.clearAllCookies()
    cy.clearAllLocalStorage()
    cy.clearAllSessionStorage()

    cy.visit('/admin')
    cy.contains('Se connecter').should('be.visible')
    cy.contains('Accédez à votre espace cinéma').should('be.visible')
  })
})
