#!/bin/bash

set -x

docker exec -u www-data app-server php occ --no-warnings config:system:get [drive.mydomain.com] >> trusted_domain.tmp

if ! grep -q "nginx-server" trusted_domain.tmp; then
    TRUSTED_INDEX=$(cat trusted_domain.tmp | wc -l);
    docker exec -u www-data app-server php occ --no-warnings config:system:set drive.nexlesoft.com $TRUSTED_INDEX --value="nginx-server"
fi

rm trusted_domain.tmp

docker exec -u www-data app-server php occ --no-warnings app:install onlyoffice

docker exec -u www-data app-server php occ --no-warnings config:system:set onlyoffice DocumentServerUrl --value="/ds-vpath/"
docker exec -u www-data app-server php occ --no-warnings config:system:set onlyoffice DocumentServerInternalUrl --value="http://onlyoffice-document-server/"
docker exec -u www-data app-server php occ --no-warnings config:system:set onlyoffice StorageUrl --value="http://nginx-server/"
