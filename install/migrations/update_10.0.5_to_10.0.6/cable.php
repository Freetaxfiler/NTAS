<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
$table = 'ntas_cables';
if (!$DB->fieldExists($table, 'is_deleted', false)) {
    $migration->addField($table, 'is_deleted', 'bool');
    $migration->addKey($table, 'is_deleted');
}

$migration->replaceRight('cable_management', READ | UPDATE | CREATE | DELETE | PURGE, [
    'cable_management' => READ | UPDATE | CREATE | PURGE,
]);
