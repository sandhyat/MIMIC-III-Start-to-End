#!/bin/bash

psql -U postgres -d mimic 
psql -c "set search_path to mimiciii;"
psql -c "\cd mimic_concept_sql" 
psql -c "\i make-concepts.sql"

