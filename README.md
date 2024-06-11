# NEXTCLOUD && ONLY OFFICE

Documents clone from https://github.com/ONLYOFFICE/docker-onlyoffice-nextcloud and custome
Use: nextcloudfpm
Need: nginx
Custome: add config redis.

## Installation

1. Get the latest version of this repository running the command:

    ```
    git clone https://github.com/ONLYOFFICE/docker-onlyoffice-nextcloud
    cd docker-onlyoffice-nextcloud
    ```

2. Run Docker Compose:

    **Please note**: the action must be performed with **root** rights.

    ```
    docker-compose up -d
    ```
    **Please note**: you might need to wait a couple of minutes when all the containers are up and running after the above command.

3. Now launch the browser and enter the webserver address. The Nextcloud wizard webpage will be opened. Enter all the necessary data to complete the wizard.

4. Go to the project folder and run the `set_configuration.sh` script:

    **Please note**: the action must be performed with **root** rights.

    ```
    bash set_configuration.sh
    ```


## Bổ sung support lỗi cho NextCloud sau khi config:

Dùng crontab run cron.php mỗi 5 phút
Từ host docker run
```
*/4 * * * * docker exec -u www-data nexcloud-server php cron.php
```
Có điều, có thể bạn phải set quyền www-data cho file này.
```
chown www-data:www-data /nexcloud-data/drive.apps/app_data/cron.php
```
## Redis test
Run: `docker exec -it redis redis-cli`
```
auth 'redisPassword'
```
Link support: https://docs.nextcloud.com/server/29/admin_manual/configuration_server/caching_configuration.html
