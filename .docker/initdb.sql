# This SQL queries contained in this file will be executed on every database container startup.

# Required for timezones usage.
# This may be executed before automatic `ntas` user creation, so we have to create it manually.
CREATE USER IF NOT EXISTS 'ntas'@'%' IDENTIFIED BY 'ntas';
SET PASSWORD FOR 'ntas'@'%' = PASSWORD('ntas');
