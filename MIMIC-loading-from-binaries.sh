#!/bin/bash

docker run \
--name MIMIC-dataCont \
-p 5436:5432 \
-e BUILD_MIMIC=0 \
-e POSTGRES_PASSWORD=postgres-pswrd \
-e MIMIC_PASSWORD=mimic-pswrd \
-v /path/to/stored/db/on/localmachine/data:/var/lib/postgresql/data \
-d docker121720/mimic-building:1.0

docker exec -it mimic /bin/bash
