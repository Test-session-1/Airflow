FROM python:3.8-slim-buster

ENV AIRFLOW_HOME=/usr/local/airflow
ENV JUPYTER_HOME=/usr/local/jupyter

RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-pip

RUN pip3 install apache-airflow[postgres,gcp,dask] \
    jupyterlab \
    dask[complete]

COPY airflow.cfg ${AIRFLOW_HOME}/airflow.cfg
COPY jupyter_notebook_config.py ${JUPYTER_HOME}/.jupyter/jupyter_notebook_config.py

EXPOSE 8080 8888

CMD airflow db init && airflow webserver -p 8080 && jupyter lab --port 8888 --no-browser --ip=0.0.0.0 --allow-root

