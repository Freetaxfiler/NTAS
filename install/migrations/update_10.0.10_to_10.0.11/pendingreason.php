<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
/* Add `previous_status` to ntas_pendingreasons_items */
if (!$DB->fieldExists('ntas_pendingreasons_items', 'previous_status')) {
    $migration->addField('ntas_pendingreasons_items', 'previous_status', "int DEFAULT NULL");
}
