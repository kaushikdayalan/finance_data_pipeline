FROM ubuntu:20.04

RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y

RUN apt-get install -y build-essential libssl-dev libffi-dev python3-dev

RUN apt-get install -y python3 python3-pip

RUN pip install "apache-airflow[celery]==2.6.2" --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-2.6.2/constraints-3.7.txt"

WORKDIR /app

COPY ./app ./app

COPY ./requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 80

CMD ["uvicorn", "app.main:app", "--proxy-headers", "--host", "0.0.0.0", "--port", "80"]