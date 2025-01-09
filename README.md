# Pipeline Project

Ce projet configure un pipeline pour déployer une application Flask via Docker, avec un proxy NGINX et des outils pour CI/CD.

## Table des matières
- [Structure du projet](#structure-du-projet)
- [Installation](#installation)
- [Utilisation](#utilisation)
- [Pipeline CI/CD](#pipeline-cicd)
- [Tests](#tests)
- [Fonctionnalités](#fonctionnalités)
- [Contributions](#contributions)

---

## Structure du projet

Pipeline/ ├── app/ # Application Flask │ ├── init.py # Initialise le package │ ├── main.py # Point d'entrée de l'application ├── nginx/ # Configuration du serveur NGINX │ └── default.conf # Proxy pass configuration ├── scripts/ # Scripts utilitaires │ └── generate_docs.py # Génération de documentation ├── tests/ # Tests unitaires │ ├── test_main.py # Tests pour le fichier main.py │ ├── init.py # Initialisation du package tests ├── .github/workflows/ # Configuration CI/CD │ └── ci.yml # Workflow GitHub Actions ├── docker-compose.yml # Orchestration des conteneurs ├── Dockerfile # Construction de l'image Docker ├── requirements.txt # Dépendances de production ├── requirements-dev.txt # Dépendances de développement └── README.md # Documentation du projet


---

## Installation

### Prérequis
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- Python 3.9 ou supérieur (si vous ne travaillez pas avec Docker)

### Étapes
1. Clonez le dépôt :
   ```bash
   git clone <url_du_repo>
   cd Pipeline

    Construisez les conteneurs Docker :

docker-compose up --build -d

Vérifiez que les services sont actifs :

    docker ps

Utilisation
Accéder à l'application Flask

    Accédez à : http://localhost

Documentation générée

    Accédez à : http://localhost/docs/ (si configurée dans NGINX).

Pipeline CI/CD

Le fichier .github/workflows/ci.yml configure un pipeline CI/CD utilisant GitHub Actions. Voici les principales étapes :

    Lint et tests :
        flake8 pour vérifier le style de code.
        pytest pour exécuter les tests unitaires.
    Construction Docker :
        Construction et push de l'image Docker.
    Déploiement :
        Déploiement sur un serveur distant via SSH (si configuré).

Tests

Pour exécuter les tests localement :

    Installez les dépendances de développement :

pip install -r requirements-dev.txt

Lancez les tests :

    pytest

Fonctionnalités

    Application Flask :
        Un simple point d'entrée configuré avec Gunicorn.
    Serveur NGINX :
        Configure un proxy pour rediriger les requêtes vers Flask.
    CI/CD :
        Déploiement automatisé via GitHub Actions.
    Docker :
        Conteneurs pour l'application et le serveur NGINX.
    Tests :
        Tests unitaires pour garantir la stabilité de l'application.

Contributions

Les contributions sont les bienvenues ! Veuillez :

    Forker ce dépôt.
    Créer une branche pour vos modifications.
    Soumettre une Pull Request.

Licence

Ce projet est sous licence MIT. Consultez le fichier LICENSE pour plus d'informations.
