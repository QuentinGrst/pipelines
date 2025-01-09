FROM python:3.9-slim

WORKDIR /app

# Installer les dépendances système nécessaires
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc build-essential && \
    rm -rf /var/lib/apt/lists/*

# Copier les fichiers de dépendances
COPY requirements.txt requirements-dev.txt ./

# Installer les dépendances Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install -r requirements-dev.txt

# Copier tout le projet dans le conteneur
COPY . .
RUN python -c "import app.main"

# Exposer le port utilisé par Gunicorn
EXPOSE 8000

# Commande pour lancer Gunicorn
CMD ["gunicorn", "app.main:app", "--bind", "0.0.0.0:8000"]
