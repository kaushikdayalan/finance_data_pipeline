FROM ubuntu:20.04

RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y

RUN apt-get update && apt-get install -y \
    dumb-init && rm -rf /var/lib/apt/lists/* \ 
    build-essential \
    python3.8 \
    python3.8-dev \
    python3-pip


RUN pip install "apache-airflow[celery]==2.6.2" --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-2.6.2/constraints-3.7.txt"

COPY . /app/

WORKDIR /app

RUN ls

RUN pip3 install --no-cache-dir -r requirements.txt

RUN airflow db init


EXPOSE 8080
EXPOSE 8888

ENTRYPOINT [ "usr/bin/dumb-init", "--", "/entrypoint" ]

