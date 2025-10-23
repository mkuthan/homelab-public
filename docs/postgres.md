# PostgreSQL

## Migrations

Updating PostgreSql requires data migration between versions.
This section shows an example of migrating a Paperless database from PostgreSQL 16 to PostgreSQL 18.

Create a new database volume "paperless-pgdata18" and a new container "paperless-postgres18" in the Ansible role.

Stop paperless service:

```shell
docker stop paperless
```

Dump old database:

```shell
docker exec -it paperless-postgres16 pg_dumpall -U paperless > paperless_backup.sql
```

Restore old database into a new one:

```shell
docker exec -i paperless-postgres18 psql -U paperless < paperless_backup.sql
```

Switch service container to the new database container in the Ansible role.

Start paperless service:

```shell
docker start
```

Cleanup old database container and volume after verifying that everything works.

```shell
docker rm paperless-postgres16
docker volume rm paperless-pgdata16
```
