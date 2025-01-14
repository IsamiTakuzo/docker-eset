#!/bin/bash

/opt/server-linux-x86_64.sh \
    --db-type="MySQL Server" \
    --db-driver "MySQL ODBC 8.0 Driver" \
    --db-hostname "${DB_HOSTNAME}" \
    --db-name "${DB_NAME}" \
    --db-admin-username "${DB_ADMIN_USERNAME}" \
    --db-admin-password "${DB_ADMIN_PASSWORD}" \
    --db-user-username "${DB_USER_USERNAME}" \
    --db-user-password "${DB_USER_PASSWORD}" \
    --server-root-password "${ERA_ADMINISTRATOR_PASSWORD}" \
    --cert-hostname "${ERA_CERT_HOSTNAME}" \
    --locale "${ERA_LOCALE}" \
    --disable-imp-program \
    --skip-license

