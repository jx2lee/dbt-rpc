ARG py_version=3.10

FROM python:$py_version-slim-buster
LABEL maintainer="jx2lee"

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -qq -y --fix-missing --no-install-recommends \
      git \
      gcc \
      build-essential \
      libpq-dev \
    && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*
RUN pip install --upgrade pip

# install dbt-rpc
COPY . /src
RUN pip install /src

# create directory for dbt
RUN mkdir -p /root/.dbt

WORKDIR /app
ENTRYPOINT ["dbt-rpc", "serve"]
