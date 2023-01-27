# Airflow

docker run -p 8080:8080 -p 8888:8888 -v /home/student_04_2fbf865f15a5/airflow_files:/usr/local/airflow -e AIRFLOW_HOME=/usr/local/airflow -it test-image


airflow users create \
          --username admin \
          --firstname FIRST_NAME \
          --lastname LAST_NAME \
          --role Admin \
          --email admin@example.org
