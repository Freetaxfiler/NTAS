<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
if (!$DB->fieldExists('ntas_authldaps', 'tls_version', false)) {
    $migration->addField('ntas_authldaps', 'tls_version', 'varchar(10) DEFAULT NULL', ['after' => 'timeout']);
}
