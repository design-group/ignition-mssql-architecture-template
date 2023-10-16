# MSSQL Docker Project Template

___

## Prerequisite

Understand the process of creating docker containers using the [docker-image](https://github.com/design-group/ignition-docker).

This project assumes you have a local Traefik reverse proxy running, if not, you can set one up using this repository [traefik-proxy](https://github.com/design-group/traefik-proxy)

___

## Setup

1. Follow [this guide from Github](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) to create a new repository from the template.
1.  Go the repository page on GitHub you created in the previous step and copy the clone link under Code-->HTTPS. Navigate to the  folder where you want to have the code.
    ```sh
    git clone <clone link for HTTPS>
    ```
1. Run the initialization script from the root directory within a bash terminal in VS Code.
    ```sh
    ./initialize.sh
    ```
1.  In a web browser, access the gateway at [http://<project-name>.localtest.me](http://<project-name>.localtest.me)

## Pre-Configured Database

The template is pre-configured with a mssql database, that can be setup with an `setup.sql` script to create the database and tables.

To setup the database, add your `setup.sql` script to the `init-sql` directory. If you want to run more DDL scripts, add them to the init-sql folder as well. The script will be run when the container is first created, and not as it is stopped and started.

Default values for Ignition Gateway Database Connection (as specified in `setup.sql`):
| Ignition Database Connection Property | Default Value (`setup.sql`)|
| ------------- | ------------- |
| Connect URL | `jdbc:sqlserver://mssql\MSSQLSERVER:1433`  |
| Username  | `Ignition`  |
| Password  | `P@ssword1!`  |
| Extra Connection Properties  | `databaseName=DEFAULT_DB`  |

Note: in the "Connect URL", `mssql` is the name of container hostname property.

```
services:
  database:
    image: bwdesigngroup.com/mssql-docker
    hostname: mssql
```
___

## Backup Database

To restore a database with a backup, create a directory called `sql-backups` and add the backup file to the `sql-backups` directory. The backup will be restored when the container is first created, and not as it is stopped and started.

___

## Gateway Config

The gateway configuration is stored in stripped gateway backups, that have all projects removed. In order to get these backups run the following command:

```sh
bash download-gateway-backups.sh
```

The backups are stored in the `backups` directory, and if configured in the compose file will automatically restore when the container is initially created. 

If you are preparing this repository for another user, after configuration of the gateway is complete, run the above backup command, and then uncomment the volume and command listed in the `docker-compose.yml` file.

___

## Troubleshooting
### Ignition Gateway Faulted
If the Ignition Gateway doesn't load properly, such as showing "Faulted", verify that the `ignition-data` directory was manually created (if not using Mac OS). If the `ignition-data` directory has no files inside, it was most likely not manually created.

To correct, first manually remove the directory:
```sh
sudo rm -r ignition-data/
```
 
Then recreate the directory:
```sh
mkdir ignition-data
```
