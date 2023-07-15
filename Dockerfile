FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    build-essential \
    python3.8 \
    python3.8-dev \
    python3-pip 
    # dumb-init && rm -rf /var/lib/apt/lists/* 

COPY . /app/

WORKDIR /app

RUN pip3 install --no-cache-dir -r requirements.txt

RUN pip3 install "apache-airflow[celery]==2.6.2" --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-2.6.2/constraints-3.7.txt"

ENV AIRFLOW_HOME=/app/airflow \
    AIRFLOW__CORE__LOAD_EXAMPLES=False \
    TZ='Europe/Paris' \
    AIRFLOW__CORE__DEFAULT_TIMEZONE="Europe/Paris" \
    AIRFLOW__WEBSERVER__DEFAULT_UI_TIMEZONE=''


EXPOSE 8080
EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
