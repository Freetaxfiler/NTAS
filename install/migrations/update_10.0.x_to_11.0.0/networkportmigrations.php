<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
if ($DB->tableExists('ntas_networkportmigrations')) {
    $migration->dropTable('ntas_networkportmigrations');
}
