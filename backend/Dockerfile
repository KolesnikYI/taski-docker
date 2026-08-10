FROM python:3.12-slim

WORKDIR /app

RUN python -m pip install --upgrade pip

COPY requirements.txt .

RUN pip install -r requirements.txt --no-cache-dir

EXPOSE 8000

COPY . . 

CMD ["gunicorn", "backend.wsgi", "-w", "4", "-t", "600", "-b", "0.0.0.0:8000"]
