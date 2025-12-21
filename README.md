# Moview - Plateforme de gestion de films

Une application web complète pour explorer des films, acteurs et réalisateurs, avec un système d'avis et une interface d'administration.

## 🎯 Fonctionnalités

- **Catalogue de films** : Parcourez une vaste collection de films avec filtres et recherche
- **Acteurs et réalisateurs** : Découvrez les talents du cinéma
- **Système d'avis** : Notez les films de 1 à 5 étoiles et partagez vos critiques
- **Interface d'administration** : Gérez films, acteurs et réalisateurs (réservé aux admins)
- **Authentification** : Système de connexion/inscription avec JWT

## 📋 Prérequis

Avant de commencer, assurez-vous d'avoir installé :

### Pour le Frontend (Nuxt 3)
- **Node.js** : version 18.x ou supérieure
- **npm** ou **yarn** ou **pnpm**

### Pour le Backend (Symfony API Platform)
- **PHP** : version 8.1 ou supérieure
- **Composer** : gestionnaire de dépendances PHP
- **MySQL** ou **PostgreSQL** : base de données
- **Symfony CLI** (recommandé) : pour lancer le serveur de développement

## 🚀 Installation

### 1️⃣ Cloner le projet

```bash
git clone <url-du-repository>
cd projet_final
```

### 2️⃣ Installation du Frontend

```bash
# Installer les dépendances
npm install
# ou
yarn install
# ou
pnpm install
```

#### Configuration du Frontend

Le frontend est déjà configuré pour se connecter au backend sur `http://localhost:8319`.

Si vous devez modifier l'URL de l'API, éditez le fichier `nuxt.config.ts` :

```typescript
runtimeConfig: {
  public: {
    apiBase: 'http://localhost:8319'  // Modifier ici si nécessaire
  }
}
```

### 3️⃣ Installation du Backend

**Note :** *Le backend Symfony doit être dans un dossier séparé. Si vous n'avez que le frontend, demandez le dépôt du backend.*

```bash
# Se déplacer dans le dossier du backend
cd ../backend  # Adapter selon votre structure

# Installer les dépendances PHP
composer install
```

#### Configuration du Backend

1. **Créer le fichier `.env.local`** à la racine du backend :

```env
# Configuration de la base de données
DATABASE_URL="mysql://username:password@127.0.0.1:3306/moview_db?serverVersion=8.0"
# ou pour PostgreSQL :
# DATABASE_URL="postgresql://username:password@127.0.0.1:5432/moview_db?serverVersion=15&charset=utf8"

# Configuration JWT (générer des clés secrètes sécurisées)
JWT_SECRET_KEY=%kernel.project_dir%/config/jwt/private.pem
JWT_PUBLIC_KEY=%kernel.project_dir%/config/jwt/public.pem
JWT_PASSPHRASE=your_passphrase_here
```

2. **Générer les clés JWT** :

```bash
php bin/console lexik:jwt:generate-keypair
```

3. **Créer la base de données** :

```bash
# Créer la base
php bin/console doctrine:database:create

# Exécuter les migrations
php bin/console doctrine:migrations:migrate

# (Optionnel) Charger des données de test
php bin/console doctrine:fixtures:load
```

## 🎬 Lancer l'application

### Démarrer le Backend

```bash
# Option 1 : Avec Symfony CLI (recommandé)
symfony server:start --port=8319

# Option 2 : Avec PHP natif
php -S localhost:8319 -t public
```

Le backend sera accessible sur **http://localhost:8319**

### Démarrer le Frontend

Dans un nouveau terminal :

```bash
# Se déplacer dans le dossier frontend
cd projet_final

# Lancer le serveur de développement
npm run dev
# ou
yarn dev
# ou
pnpm dev
```

Le frontend sera accessible sur **http://localhost:3000**

## 👤 Compte Administrateur

Pour accéder à l'interface d'administration (`/admin`), vous devez vous connecter avec un compte ayant le rôle `ROLE_ADMIN`.

Si vous avez chargé les fixtures, un compte admin devrait être disponible. Sinon, créez-en un manuellement dans la base de données ou via une commande Symfony.

Exemple de compte admin :
- Email : `admin@example.com`
- Mot de passe : `admin123`

## 📁 Structure du projet

```
projet_final/
├── app/                      # Code source Nuxt
│   ├── assets/              # CSS, images, etc.
│   ├── components/          # Composants Vue réutilisables
│   ├── composables/         # Composables Vue (useAuth, useAdmin, etc.)
│   ├── middleware/          # Middlewares Nuxt (admin.ts, etc.)
│   ├── pages/               # Pages de l'application
│   │   ├── index.vue       # Page d'accueil
│   │   ├── login.vue       # Page de connexion
│   │   ├── register.vue    # Page d'inscription
│   │   ├── admin.vue       # Interface d'administration
│   │   ├── movies/         # Pages films
│   │   ├── acteurs/        # Pages acteurs
│   │   └── directeurs/     # Pages réalisateurs
│   └── public/             # Fichiers statiques
├── nuxt.config.ts          # Configuration Nuxt
├── package.json            # Dépendances Node.js
└── README.md               # Ce fichier
```

## 🛠️ Technologies utilisées

### Frontend
- **Nuxt 3** : Framework Vue.js
- **Vue 3** : Framework JavaScript progressif
- **TailwindCSS** : Framework CSS utility-first
- **nuxt-gql-pulse** : Client GraphQL pour Nuxt
- **Pinia** : State management

### Backend
- **Symfony 7** : Framework PHP
- **API Platform** : Création d'API REST et GraphQL
- **Doctrine ORM** : Mapping objet-relationnel
- **LexikJWTAuthenticationBundle** : Authentification JWT
- **MySQL/PostgreSQL** : Base de données

## 🔧 Scripts disponibles

### Frontend

```bash
# Développement
npm run dev

# Build de production
npm run build

# Prévisualiser le build de production
npm run preview

# Générer une version statique
npm run generate
```

### Backend

```bash
# Lancer le serveur
symfony server:start --port=8319

# Créer la base de données
php bin/console doctrine:database:create

# Migrations
php bin/console doctrine:migrations:migrate

# Charger les fixtures
php bin/console doctrine:fixtures:load

# Nettoyer le cache
php bin/console cache:clear
```

## 📝 API Documentation

Une fois le backend lancé, la documentation de l'API est accessible sur :
- **API REST** : http://localhost:8319/api
- **GraphQL Playground** : http://localhost:8319/api/graphql

## 🐛 Résolution de problèmes

### Le frontend ne se connecte pas au backend
- Vérifiez que le backend tourne bien sur le port 8319
- Vérifiez la configuration CORS dans le backend (fichier `config/packages/nelmio_cors.yaml`)

### Erreur JWT lors de la connexion
- Vérifiez que les clés JWT ont bien été générées
- Vérifiez les permissions des fichiers de clés (config/jwt/)

### Erreur de base de données
- Vérifiez que MySQL/PostgreSQL est bien démarré
- Vérifiez les credentials dans le fichier `.env.local`
- Assurez-vous que la base de données existe

### Port déjà utilisé
Si le port 8319 ou 3000 est déjà utilisé, vous pouvez les changer :
- **Frontend** : modifier dans `package.json` ou utiliser `npm run dev -- --port 3001`
- **Backend** : `symfony server:start --port=8320`

## 👨‍🏫 Pour le professeur

### Lancement rapide

1. **Backend** :
```bash
cd backend
composer install
php bin/console doctrine:database:create
php bin/console doctrine:migrations:migrate
php bin/console doctrine:fixtures:load  # Données de test
symfony server:start --port=8319
```

2. **Frontend** :
```bash
cd projet_final
npm install
npm run dev
```

3. Ouvrir **http://localhost:3000** dans le navigateur

### Compte de test
- **Admin** : admin@example.com / admin123
- **User** : user@example.com / user123

## 📄 Licence

Projet universitaire - WR505

## 👥 Auteur

Développé dans le cadre du cours WR505
