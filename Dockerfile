FROM python:3.13-alpine
RUN apk add --no-cache --virtual .build-deps \
    build-base \
    libffi-dev \
    openssl-dev \
    curl \
    && apk add --no-cache \
    libpq

COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt \
    && rm -rf /root/.cache

COPY . /usr/src/app/
WORKDIR /usr/src/app
EXPOSE 8080

CMD ["gunicorn"  , "-b", "0.0.0.0:8080", "application:application"]
