FROM packages.aa.com/docker-all/python:3.10-slim-bullseye AS builder
LABEL maintainer="tester"
EXPOSE 9900

RUN apt-get update && apt-get install --assume-yes --no-install-recommends --yes python3-venv python3-wheel gcc libpython3-dev default-libmysqlclient-dev curl wget unzip && \
 python3 -m venv /venv && \
 /venv/bin/pip3 install --upgrade pip

FROM builder AS builder-venv

COPY ./Pipfile .
COPY ./Pipfile.lock .

RUN /venv/bin/pip3 install pipenv
RUN . /venv/bin/activate && pipenv install --ignore-pipfile


WORKDIR /
COPY . /app
ENV NAME=rahul
ENV GENDER=male
ENV PYTHONPATH "${PYTHONPATH}:/venv/bin"
ENV PATH="/venv/bin:$PATH"

CMD ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "9900"]