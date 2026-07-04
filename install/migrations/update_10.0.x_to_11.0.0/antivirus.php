<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 * @var DBmysql $DB
 */
$default_key_sign = DBConnection::getDefaultPrimaryKeySignOption();

if ($DB->tableExists('ntas_computerantiviruses')) {
    $migration->renameTable('ntas_computerantiviruses', 'ntas_itemantiviruses');
}

if (!$DB->fieldExists('ntas_itemantiviruses', 'itemtype')) {
    $migration->addField(
        'ntas_itemantiviruses',
        'itemtype',
        'string',
        [
            'after'  => 'id',
            'update' => $DB->quoteValue('Computer'), // Defines value for all existing elements
        ]
    );
    $migration->migrationOneTable('ntas_itemantiviruses');
}

if (!$DB->fieldExists('ntas_itemantiviruses', 'items_id')) {
    $migration->dropKey('ntas_itemantiviruses', 'computers_id');
    $migration->changeField(
        'ntas_itemantiviruses',
        'computers_id',
        'items_id',
        "int {$default_key_sign} NOT NULL DEFAULT '0'",
        [
            'after' => 'itemtype',
        ]
    );
    $migration->migrationOneTable('ntas_itemantiviruses');
}

$migration->addKey('ntas_itemantiviruses', ['itemtype', 'items_id'], 'item');
