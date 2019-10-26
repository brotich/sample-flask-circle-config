FROM python:3.6-alpine

RUN apk update \
    && apk add --no-cache postgresql-libs \
    && apk add --no-cache --virtual .build-deps \
        gcc \
        musl-dev \
        libffi-dev \
        postgresql-dev

WORKDIR /app
COPY ./requirements ./requirements
RUN pip install -r requirements/dev.txt

RUN apk --purge del .build-deps

COPY . .


