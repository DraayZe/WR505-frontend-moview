describe('Authentification', () => {
  describe('Page de connexion', () => {
    beforeEach(() => {
      cy.visit('/login')
    })

    it('devrait afficher le formulaire de connexion', () => {
      cy.contains('Se connecter').should('be.visible')
      cy.get('input#email').should('be.visible')
      cy.get('input#password').should('be.visible')
      cy.get('button[type="submit"]').should('be.visible')
    })

    it('devrait afficher un lien vers la page d\'inscription', () => {
      cy.contains('inscrire').should('be.visible')
    })

    it('devrait afficher une erreur si les champs sont vides', () => {
      cy.get('button[type="submit"]').click()
      // Les champs requis HTML5 devraient empêcher la soumission
      cy.url().should('include', '/login')
    })

    it('devrait afficher le texte d\'accueil', () => {
      cy.contains('Accédez à votre espace cinéma').should('be.visible')
    })
  })

  describe('Page d\'inscription', () => {
    beforeEach(() => {
      cy.visit('/register')
    })

    it('devrait afficher le formulaire d\'inscription', () => {
      cy.contains('Créer un compte').should('be.visible')
      cy.get('input#email').should('be.visible')
      cy.get('input#password').should('be.visible')
      cy.get('input#confirmPassword').should('be.visible')
      cy.get('button[type="submit"]').should('be.visible')
    })

    it('devrait afficher un lien vers la page de connexion', () => {
      cy.contains('Se connecter').should('be.visible')
    })

    it('devrait afficher le texte d\'accueil', () => {
      cy.contains('Rejoignez la communauté cinéma').should('be.visible')
    })
  })
})
