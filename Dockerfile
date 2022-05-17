# Use python image version 3.9 slim
FROM python:3.9-slim AS compile-stage

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    build-essential gcc

# Set working directory
WORKDIR /usr/src/app

# Set python virtual environment
RUN python -m venv /usr/src/app/venv
ENV PATH="/usr/src/app/venv/bin:$PATH"

# Copy requirements only
COPY requirements.txt .

# Install requirements
RUN pip3 install -r requirements.txt

# Second stage
FROM python:3.9-slim

# Make a new user, implement least privilege
RUN groupadd -g 999 python && \
    useradd -r -u 999 -g python python

# make a new directory and set permission to python user
RUN mkdir /usr/src/app && chown python:python /usr/src/app
WORKDIR /usr/src/app

# Copy as a new user
COPY --chown=python:python --from=compile-stage /usr/src/app/venv ./venv
COPY --chown=python:python . .

# Run as user group
USER 999

# Run the webapp
ENV PATH="/usr/src/app/venv/bin:$PATH"
ENV DEBUG=0

CMD gunicorn wsgi:app --bind 0.0.0.0:5000