#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
  CREATE DATABASE cash_register;
  CREATE DATABASE cash_register_test;
EOSQL
