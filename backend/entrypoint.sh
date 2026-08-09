#!/bin/sh

# Останавливать выполнение при любой ошибке
set -e

echo "Выполнение миграций."
python manage.py migrate --noinput

echo "Сбор статики."
python manage.py collectstatic --noinput

echo "Копирование статики в volume."
mkdir -p /backend_static/static
cp -r /app/collected_static/. /backend_static/static/

# Передаем управление команде из CMD (запуск Gunicorn)
exec "$@"
