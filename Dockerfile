
FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt requirements-dev.txt ./

RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc build-essential && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

RUN pip install -r requirements-dev.txt

COPY . .

EXPOSE 8000

CMD ["gunicorn", "app.main:app", "--bind", "0.0.0.0:8000"]
