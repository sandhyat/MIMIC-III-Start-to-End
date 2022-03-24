# MIMIC-III-Start-to-End

This repository presents a step by step process of building the mimic-iii database in two ways:

## From scratch using the zipped csv files

0) Make sure you have docker and git installed on the machine. Also, you are expected to have the zipped mimic-iii csv files locally.

1) Update Full-MIMIC-building-pipeline-1.sh by adding the correct location of the csv files in docker run command. Also, update the location where you would like to keep the built database for future loading.

2) Run Full-MIMIC-building-pipeline-1.sh on the terminal.

3) Obtain the running container's id by 'docker ps -a' and check the logs for progress on the database build using 'docker logs -f YOUR_CONTAINER_ID'. Once the logs says that 'PostgreSQL init process complete; ready for start up.', start the container in bash by going to step 4.

4) Run 'docker exec -it mimic /bin/bash' to get inside the running container.

5) Run Full-MIMIC-building-pipeline-2.sh on the terminal to build some existing concepts (additional views of comorbidities etc). Note that these views will also be saved along with the built database. The commands inside this file can be run one by one also to make it more interactive.

6) Check the status of the database by running following:
*) psql -U postgres -d mimic   # on the terminal

*) \dn  # lists the name of the schemas

*) set search_path to mimiciii;  # on psql console

*) select * from patients limit 10;

*) \q  # exits the psql console

*) exit  # exits the container

7) You can check if the location that given in Step 1 for storing the built database is written or not. You should find an image named 'postgres/mimic' when you run 'docker images' on terminal.

## From already built binaries and a docker image
