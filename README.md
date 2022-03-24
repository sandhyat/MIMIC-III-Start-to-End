# MIMIC-III-Start-to-End

Most of the code in this repository is a customized version from https://github.com/MIT-LCP/mimic-code/tree/main/mimic-iii . This repository presents a step by step process of accessing the mimic-iii database inside a psql docker container in following two ways:

## From scratch using the zipped csv files

0) Make sure you have docker and git installed on the machine. Also, you are expected to have the zipped mimic-iii csv files locally.

1) Update Full-MIMIC-building-pipeline-1.sh by adding the correct location of the csv files in docker run command. Also, update the location where you would like to keep the built database for future loading.

2) Run Full-MIMIC-building-pipeline-1.sh on the terminal.

3) Obtain the running container's id by 'docker ps -a' and check the logs for progress on the database build using 'docker logs -f YOUR_CONTAINER_ID'. Once the logs says that 'PostgreSQL init process complete; ready for start up.', start the container in bash by going to step 4.

4) Run 'docker exec -it mimic /bin/bash' to get inside the running container.

5) Run Full-MIMIC-building-pipeline-2.sh on the terminal to build some existing concepts (additional views of comorbidities etc). Note that these views will also be saved along with the built database. The commands inside this file can be run one by one also to make it more interactive.

6) Check the status of the database by running following:

  *) psql -U postgres -d mimic   # on the container's terminal

  *) \dn     # lists the name of the schemas

  *) set search_path to mimiciii;   # on psql console

  *) select * from patients limit 10;

  *) \q    # exits the psql console

  *) exit   # exits the container

7) You can check if the location that given in Step 1 for storing the built database is written or not. You should find an image named 'postgres/mimic' when you run 'docker images' on terminal.

## From already built binaries and a docker image

0) Make sure you have the location for already built compressed database.

1) Pull the docker image from the docker hub using "docker pull docker121720/mimic-building:1.0"

2) Update MIMIC-loading-from-binaries.sh by including the location of the built binaries in docker run command.

3) Run MIMIC-loading-from-binaries.sh on the terminal. After the file has been executed, you will be inside the container 'MIMIC-dataCont'.

4) Step 6 from the above method can be followed to check the status of the database.


### Important points to note:

1) Make sure the ports 5434 and 5436 are not busy before running the .sh files in either approach.

2) Note the difference between the value of environment variable BUILD_MIMIC in the docker run command in the .sh files.

3) If you want to newly build or rebuild some concepts and you get error 'no space left on the device' or something related to shared memory, update the docker run command by adding '--shm-size=1g'
