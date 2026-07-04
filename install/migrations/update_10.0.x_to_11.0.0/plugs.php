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

if ($DB->tableExists('ntas_pdus_plugs')) {
    $migration->renameTable('ntas_pdus_plugs', 'ntas_items_plugs');
}

if (!$DB->fieldExists('ntas_items_plugs', 'itemtype')) {
    $migration->addField(
        'ntas_items_plugs',
        'itemtype',
        'varchar(255) NOT NULL',
        [
            'after'  => 'plugs_id',
            'update' => $DB::quoteValue('PDU'), // Defines value for all existing elements
        ]
    );
    $migration->migrationOneTable('ntas_items_plugs');
}

if (!$DB->fieldExists('ntas_items_plugs', 'items_id')) {
    $migration->dropKey('ntas_items_plugs', 'pdus_id');
    $migration->changeField(
        'ntas_items_plugs',
        'pdus_id',
        'items_id',
        "int {$default_key_sign} NOT NULL DEFAULT '0'",
        [
            'after' => 'itemtype',
        ]
    );
    $migration->migrationOneTable('ntas_items_plugs');
}

$migration->addKey('ntas_items_plugs', ['itemtype', 'items_id'], 'item');
