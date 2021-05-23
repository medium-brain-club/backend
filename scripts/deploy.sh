#!/bin/sh

cd /opt/docker/backend/deployments
docker-compose down

cd ..
git pull
make clean
make all
sqlite3 assets/backend.db <scripts/test_populate_db.sql

cd deployments
docker-compose up -d
