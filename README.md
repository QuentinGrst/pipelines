Pipeline Project

Ce projet configure un pipeline pour déployer (ou publier) une application Flask sous forme de Release sur GitHub, avec un conteneur Docker optionnel et un ensemble d’outils pour la CI/CD (lint, tests, sécurité, mesure de couverture et complexité).
Table des matières

    Structure du projet
    Installation
    Utilisation
    Pipeline CI/CD
    Tests
    Analyse de code
    Fonctionnalités
    Contributions
    Licence

Structure du projet

Pipeline/
├── app/                  # Application Flask
│   ├── __init__.py       # Initialise le package
│   └── main.py           # Point d'entrée de l'application
├── scripts/              # Scripts utilitaires
│   └── generate_docs.py  # Génération de documentation (exemple)
├── tests/                # Tests unitaires
│   ├── test_main.py      # Tests pour le fichier main.py
│   └── __init__.py       # Initialisation du package tests
├── .github/workflows/    # Configuration CI/CD
│   └── ci.yml            # Workflow GitHub Actions
├── docker-compose.yml    # (Optionnel) Orchestration des conteneurs
├── Dockerfile            # (Optionnel) Construction de l'image Docker
├── requirements.txt      # Dépendances de production
├── requirements-dev.txt  # Dépendances de développement
└── README.md             # Documentation du projet

Installation
Prérequis

    Docker (uniquement si tu souhaites construire l’image Docker)
    Python 3.9 ou supérieur (si tu lances l’app ou les tests en local)

Étapes

    Clonez le dépôt :

git clone <url_du_repo>
cd Pipeline

(Optionnel) Construisez les conteneurs Docker :

docker-compose up --build -d

Vérifiez que les services sont actifs :

    docker ps

Utilisation
Lancer l’application Flask en local

    Installez les dépendances :

pip install -r requirements.txt

Lancez main.py (ou un serveur Gunicorn, etc.) :

    python app/main.py

    L’application est accessible sur http://localhost:5000 (par défaut).

Documentation générée

Lorsque la pipeline GitHub Actions s’exécute, elle génère automatiquement de la documentation HTML (pydoc) et la publie sous forme d’artefact / release. Vous pouvez la télécharger depuis l’onglet “Releases” sur GitHub.
Pipeline CI/CD

Le fichier .github/workflows/ci.yml configure un pipeline CI/CD utilisant GitHub Actions. Voici les principales étapes :

    Lint et Qualité :
        flake8 pour vérifier le style de code.
        bandit pour l’audit de sécurité.
        radon pour la mesure de complexité et de maintenabilité.

    Tests unitaires :
        pytest pour exécuter les tests.
        pytest-cov pour mesurer la couverture et générer un rapport coverage.xml.

    Documentation :
        pydoc pour générer la doc HTML.
        Archive docs.zip attachée aux Releases GitHub.

    Construction Docker (Optionnel) :
        Build et push de l’image Docker sur Docker Hub (avec un tag différent selon la branche : latest ou qualif).

    Release sur GitHub :
        Création d’une Release GitHub (tag automatique basé sur la branche et le numéro du run).
        Ajout des assets : documentation zippée, et un package de l’app (app_build.zip).

Tests

Pour exécuter les tests localement :

    Installez les dépendances de développement :

pip install -r requirements-dev.txt

Lancez les tests :

    pytest --cov=app --cov-report=term-missing

En fin d’exécution, un rapport de couverture sera affiché dans la console. Pour générer un fichier coverage.xml, utilisez --cov-report=xml.
Analyse de code

Grâce à radon, la pipeline analyse la complexité cyclomatique et la maintenabilité du code :

radon cc app --total-average
radon mi app

Les résultats sont affichés dans la console de GitHub Actions. Vous pouvez ainsi repérer les fonctions trop complexes ou les zones à refactoriser.
Fonctionnalités

    Application Flask : Un point d’entrée simple via app/main.py.
    CI/CD :
        Qualité de code (flake8, bandit, radon).
        Couverture de tests (pytest + pytest-cov).
        Génération de documentation (pydoc).
        Création de Releases GitHub (documentation, artefacts).
        (Optionnel) Construction et push d’une image Docker.
    Tests : Tests unitaires pour garantir la stabilité de l’application.

Contributions

Les contributions sont les bienvenues ! Veuillez :

    Forker ce dépôt.
    Créer une branche pour vos modifications.
    Soumettre une Pull Request.

Licence

Ce projet est sous licence MIT. Consultez le fichier LICENSE pour plus d’informations.