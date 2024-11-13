FROM python:3.13-bookworm

WORKDIR /app

# Allow us to use the same Dockerfile for production and development
# environments. Development packages are conditionally installed.
ARG DEVELOPMENT=false
ENV DEVELOPMENT=${DEVELOPMENT}

RUN apt-get update && \
    apt-get install -yq \
        make && \
    if ${DEVELOPMENT}; then apt-get install -yq \
        git \
        postgresql-client \
        ; fi && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app

RUN make install && if ${DEVELOPMENT}; then make install-dev; fi;

CMD [ "python manage.py runserver" ]
