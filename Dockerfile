# Základní obraz
FROM python:3.7

# Nastavení pracovního adresáře v kontejneru
WORKDIR /app

# Kopírování souborů s námi potřebnými závislostmi do kontejneru
COPY requirements.txt ./

# Instalace závislostí
RUN pip install --no-cache-dir -r requirements.txt

# Kopírování zdrojového kódu do kontejneru
COPY . .

# Spuštění Python skriptu
CMD ["python", "./app.py"]
