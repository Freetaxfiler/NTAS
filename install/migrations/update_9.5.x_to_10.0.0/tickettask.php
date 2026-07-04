<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
$default_key_sign = DBConnection::getDefaultPrimaryKeySignOption();

/* Add `sourceof_items_id` to some ntas_tickettasks */
if (!$DB->fieldExists('ntas_tickettasks', 'sourceof_items_id')) {
    $migration->addField('ntas_tickettasks', 'sourceof_items_id', "int {$default_key_sign} NOT NULL DEFAULT '0'", ['value' => 0]);
    $migration->addKey('ntas_tickettasks', 'sourceof_items_id');
}
