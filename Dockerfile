FROM python:3.9.10-slim-buster

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
RUN apt update -y && apt install -y build-essential python3-dev python3-pip python3-setuptools python3-wheel python3-cffi libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info

COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip \
    && pip install setuptools==50.3.2  \
    && pip install --no-cache-dir -r /tmp/requirements.txt -i https://mirrors.aliyun.com/pypi/simple \
    && rm -rf /tmp/requirements.txt \
    && useradd -U app_user \
    && install -d -m 0755 -o app_user -g app_user /app/static

WORKDIR /app
USER app_user:app_user
COPY --chown=app_user:app_user .. .

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]