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

if ($DB->tableExists('ntas_computervirtualmachines')) {
    $migration->renameTable('ntas_computervirtualmachines', 'ntas_itemvirtualmachines');
}

if (!$DB->fieldExists('ntas_itemvirtualmachines', 'itemtype')) {
    $migration->addField(
        'ntas_itemvirtualmachines',
        'itemtype',
        'string',
        [
            'after'  => 'id',
            'update' => $DB->quoteValue('Computer'), // Defines value for all existing elements
        ]
    );
    $migration->migrationOneTable('ntas_itemvirtualmachines');
}

if (!$DB->fieldExists('ntas_itemvirtualmachines', 'items_id')) {
    $migration->dropKey('ntas_itemvirtualmachines', 'computers_id');
    $migration->changeField(
        'ntas_itemvirtualmachines',
        'computers_id',
        'items_id',
        "int {$default_key_sign} NOT NULL DEFAULT '0'",
        [
            'after' => 'itemtype',
        ]
    );
    $migration->migrationOneTable('ntas_itemvirtualmachines');
}

$migration->addKey('ntas_itemvirtualmachines', ['itemtype', 'items_id'], 'item');
