# Dockerfile

FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Set default port
EXPOSE 8000

# Use shell to allow DB wait + migrate
CMD sh -c "python manage.py collectstatic --noinput && python manage.py migrate && gunicorn todo_project.wsgi:application --bind 0.0.0.0:8000"
