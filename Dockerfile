FROM python:3.6-alpine

RUN apk update \
    && apk add --no-cache \
        bash \
        postgresql-libs \
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

ENV CONDUIT_SECRET='something-really-secret'
ENTRYPOINT [ "./scripts/entrypoint.sh" ]
CMD ["flask", "run", "--host=0.0.0.0", "--port=5050"]
