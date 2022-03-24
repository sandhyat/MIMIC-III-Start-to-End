#!/bin/bash

git clone git@github.com:sandhyat/MIMIC-III-Start-to-End.git

cd MIMIC-III-Start-to-End
git pull

cd build_mimic

docker build -t postgres/mimic .

docker run \
--name mimic \
--shm-size=1g \
-p 5434:5432 \
-e BUILD_MIMIC=1 \
-e POSTGRES_PASSWORD=postgres-pswrd \
-e MIMIC_PASSWORD=mimic-pswrd \
-v /path/to/mimic-zipped-csvs:/mimic_data \
-v /path/to/store/db/on/localmachine:/var/lib/postgresql/data \
-v /MIMIC-III-Start-to-End/concepts:/mimic_concept_sql \
-d postgres/mimic
