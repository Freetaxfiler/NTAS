<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
/* Add `event` to some ntas_queuednotifications */
if (!$DB->fieldExists('ntas_queuednotifications', 'event')) {
    $migration->addField('ntas_queuednotifications', 'event', 'varchar(255) DEFAULT NULL', ['value' => null]);
}
