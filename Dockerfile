# Základní obraz
FROM python:3.7

# Nastavení pracovního adresáře v kontejneru
WORKDIR /app

# Kopírování souborů s námi potřebnými závislostmi do kontejneru
COPY app/requirements.txt ./

# Instalace závislostí
RUN pip install --no-cache-dir -r requirements.txt

# Kopírování zdrojového kódu do kontejneru
COPY app/calculator.py .

# Kopírování složky templates do kontejneru
COPY templates ./templates

# Spuštění Python skriptu
CMD ["python", "calculator.py"]
