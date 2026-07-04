<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */

if ($DB->tableExists('ntas_computers_items')) {
    $migration->renameTable('ntas_computers_items', 'ntas_assets_assets_peripheralassets');
}

// Main item polymorphic foreign key
$migration->dropKey('ntas_assets_assets_peripheralassets', 'computers_id');
$migration->addField(
    'ntas_assets_assets_peripheralassets',
    'itemtype_asset',
    'varchar(255) NOT NULL',
    [
        'after'  => 'id',
        'update' => $DB->quoteValue('Computer'), // Defines value for all existing elements
    ]
);
if ($DB->fieldExists('ntas_assets_assets_peripheralassets', 'computers_id')) {
    $migration->changeField(
        'ntas_assets_assets_peripheralassets',
        'computers_id',
        'items_id_asset',
        'fkey'
    );
}
$migration->migrationOneTable('ntas_assets_assets_peripheralassets');
$migration->addKey('ntas_assets_assets_peripheralassets', ['itemtype_asset', 'items_id_asset'], 'item_asset');

// Peripheral polymorphic foreign key
$migration->dropKey('ntas_assets_assets_peripheralassets', 'item');
if ($DB->fieldExists('ntas_assets_assets_peripheralassets', 'itemtype')) {
    $migration->changeField(
        'ntas_assets_assets_peripheralassets',
        'itemtype',
        'itemtype_peripheral',
        'varchar(255) NOT NULL'
    );
}
if ($DB->fieldExists('ntas_assets_assets_peripheralassets', 'items_id')) {
    $migration->changeField(
        'ntas_assets_assets_peripheralassets',
        'items_id',
        'items_id_peripheral',
        'fkey'
    );
}
$migration->migrationOneTable('ntas_assets_assets_peripheralassets');
$migration->addKey('ntas_assets_assets_peripheralassets', ['itemtype_peripheral', 'items_id_peripheral'], 'item_peripheral');
