#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt
python manage.py collectstatic --no-input
python manage.py migrate
python manage.py createsuperuser --noinput --username ANA --email sofm100529mmcllxa0@soycecytem.mx || true
python manage.py shell -c "from django.contrib.auth import get_user_model; User = get_user_model(); u = User.objects.get(username='ANA'); u.set_password('nomita'); u.save()"