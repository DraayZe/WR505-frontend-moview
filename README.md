# Moview - Plateforme de gestion de films

Une application web complète pour explorer des films, acteurs et réalisateurs, avec un système d'avis et une interface d'administration.

### Installer d'abord la partie back-end

Créer un nouveau dossier par exemple Moview-lenny-back-end

```bash
cd Moview-lenny-back-end
```

### Créer le fichier docker-compose.yml

```bash
nano docker-compose.yml
```

```bash
version: '3.8'
services:
  web:
    image: mmi3docker/symfony-2024
    container_name : moview-backend
    hostname: symfony-web
    restart: always
    ports:
      - 8919:80
    depends_on:
      - db

    volumes:
      - ./www/:/var/www/
      - ./sites/:/etc/apache2/sites-enabled/

  db:
    image: mariadb:10.8
    container_name: moview-backend-db
    hostname: symfony-test
    restart: always

    volumes:
      - db-volume:/var/lib/mysql

    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: moview
      MYSQL_USER: user
      MYSQL_PASSWORD: password

  phpmyadmin:
    image: phpmyadmin/phpmyadmin
    container_name: moview-backend-adminsql
    hostname: symfony-adminsql
    restart: always
    ports:
      - 8986:80
    environment:
      PMA_HOST: db
      MYSQL_ROOT_PASSWORD: password
      MYSQL_USER: user
      MYSQL_PASSWORD: password
      MYSQL_DATABASE: moview

  maildev:
    image: maildev/maildev
    container_name: moview-backend-mail
    hostname: symfony-mail
    command: bin/maildev --web 1080 --smtp 1025 --hide-extensions STARTTLS
    restart: always

    ports:
      - 1980:1080

volumes:
  db-volume:
```

```bash
docker compose up -d
```

#### Configurer le .conf

```bash
docker exec -ti moview-backend bash

cd /etc/apache2/sites-enabled/

nano 000-default.conf
```

```bash

<VirtualHost *:80>
ServerName localhost
DocumentRoot /var/www/html/wr506d/public

<Directory /var/www/html/wr506d/public>
# Support des fichiers htaccess
AllowOverride All

<IfModule mod_rewrite.c>
    RewriteEngine On

    RewriteCond %{REQUEST_URI}::$0 ^(/.+)/(.*)::\2$
    RewriteRule .* - [E=BASE:%1]

    RewriteCond %{HTTP:Authorization} .+
    RewriteRule ^ - [E=HTTP_AUTHORIZATION:%0]

    RewriteCond %{ENV:REDIRECT_STATUS} =""
    RewriteRule ^index\.php(?:/(.*)|$) %{ENV:BASE}/$1 [R=301,L]

    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ %{ENV:BASE}/index.php [L]

</IfModule>

</Directory>

ErrorLog ${APACHE_LOG_DIR}/symfony_error.log
CustomLog ${APACHE_LOG_DIR}/symfony_access.log combined



</VirtualHost>
```

```bash
service apache2 restart
```

#### Ensuite on va installer le projet

```bash
cd /Moview-lenny-back-end/www/html/wr506d
git clone -b develop https://github.com/DraayZe/wr506d.git
composer install
```

#### Le projet est installé

#### Il faut configurer le .env, aller dans le dossier du projet (wr506d) et copier le fichier .env

```bash
cp .env .env.local

nano .env.local

DATABASE_URL="mysql://user:password@db:3306/moview?serverVersion=10.8.8-MariaDB&charset=utf8mb4"
```

#### Il faut aussi générer les keys, toujours dans le dossier du projet (wr506d)

```bash
bin/console lexik:jwt:generate-keypair
```

#### Ensuite, il faut installer le front-end. Placez-vous dans un dossier, par exemple, Moview-lenny-front-end

```bash
cd /Moview-lenny-front-end
git clone -b develop https://github.com/DraayZe/projet_final_vue.git
cd projet_final_vue
npm i
```

#### Créer le fichier .env

```bash
nano .env

API_BASE_URL=http://localhost:8919
```
### Modifier aussi le fichier nuxt.config.js, configurer les bons ports

```bash
import tailwindcss from "@tailwindcss/vite";

export default defineNuxtConfig({
  compatibilityDate: "2025-07-15",
  devtools: { enabled: true },
  css: ['./app/assets/css/main.css'],
  vite: {
    plugins: [
      tailwindcss(),
    ],
  },
  runtimeConfig: {
    public: {
      apiBase: 'http://localhost:8919'
    }
  },
  modules: ['nuxt-gql-pulse'],

  gqlPulse: {
    clients: {
      backendapi: {
        endpoint: 'http://localhost:8919/api/graphql',
      },
    },
  },
});
```

### Pour finir, importez la base de données, le fichier moview.sql dans le projet

```bash
http://localhost:8986/
```

### Utilisateur : user et mot de passe : password

### Importer / choisir un fichier et c'est bons

### Le projet est maintenant correctement installé et fonctionnel, lancez rpm run dev dans la partie front et vous pouvez utiliser le site web

```bash
rpm run dev 
```


