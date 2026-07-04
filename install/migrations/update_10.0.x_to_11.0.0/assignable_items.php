<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

use Glpi\DBAL\QueryExpression;
use Glpi\DBAL\QuerySubQuery;

/**
 * @var array $ADDTODISPLAYPREF
 * @var DBmysql $DB
 * @var Migration $migration
 */

$default_charset = DBConnection::getDefaultCharset();
$default_collation = DBConnection::getDefaultCollation();
$default_key_sign = DBConnection::getDefaultPrimaryKeySignOption();

// Add assignable assets rights
$assignable_asset_rights = [
    'computer', 'monitor', 'software', 'networking', 'printer',
    'cartridge', 'consumable', 'phone', 'peripheral',
];
foreach ($assignable_asset_rights as $rightname) {
    $migration->addRight($rightname, READ_ASSIGNED, [$rightname => READ]);
    $migration->addRight($rightname, UPDATE_ASSIGNED, [$rightname => UPDATE]);
    $migration->addRight($rightname, READ_OWNED, [$rightname => READ]);
    $migration->addRight($rightname, UPDATE_OWNED, [$rightname => UPDATE]);
}

$assignable_itemtypes = [
    'Appliance' => [
        'table' => 'ntas_appliances',
        'rightname' => 'appliance',
    ],
    'Cable' => [
        'table' => 'ntas_cables',
        'rightname' => 'cable_management',
    ],
    'CartridgeItem' => [
        'table' => 'ntas_cartridgeitems',
        'rightname' => 'cartridge',
    ],
    'Certificate' => [
        'table' => 'ntas_certificates',
        'rightname' => 'certificate',
    ],
    'Cluster' => [
        'table' => 'ntas_clusters',
        'rightname' => 'cluster',
    ],
    'Computer' => [
        'table' => 'ntas_computers',
        'rightname' => 'computer',
    ],
    'ConsumableItem' => [
        'table' => 'ntas_consumableitems',
        'rightname' => 'consumable',
    ],
    'DatabaseInstance' => [
        'table' => 'ntas_databaseinstances',
        'rightname' => 'databaseinstance',
    ],
    'Domain' => [
        'table' => 'ntas_domains',
        'rightname' => 'domain',
    ],
    'DomainRecord' => [
        'table' => 'ntas_domainrecords',
        'rightname' => 'domain',
    ],
    'Enclosure' => [
        'table' => 'ntas_enclosures',
        'rightname' => 'datacenter',
    ],
    'Item_DeviceSimcard' => [
        'table' => 'ntas_items_devicesimcards',
        'rightname' => 'device',
    ],
    'Line' => [
        'table' => 'ntas_lines',
        'rightname' => 'line',
    ],
    'Monitor' => [
        'table' => 'ntas_monitors',
        'rightname' => 'monitor',
    ],
    'NetworkEquipment' => [
        'table' => 'ntas_networkequipments',
        'rightname' => 'networking',
    ],
    'PassiveDCEquipment' => [
        'table' => 'ntas_passivedcequipments',
        'rightname' => 'datacenter',
    ],
    'PDU' => [
        'table' => 'ntas_pdus',
        'rightname' => 'datacenter',
    ],
    'Peripheral' => [
        'table' => 'ntas_peripherals',
        'rightname' => 'peripheral',
    ],
    'Phone' => [
        'table' => 'ntas_phones',
        'rightname' => 'phone',
    ],
    'Printer' => [
        'table' => 'ntas_printers',
        'rightname' => 'printer',
    ],
    'Rack' => [
        'table' => 'ntas_racks',
        'rightname' => 'datacenter',
    ],
    'Software' => [
        'table' => 'ntas_softwares',
        'rightname' => 'software',
    ],
    'SoftwareLicense' => [
        'table' => 'ntas_softwarelicenses',
        'rightname' => 'license',
    ],
    'Unmanaged' => [
        'table' => 'ntas_unmanageds',
        'rightname' => 'unmanaged',
    ],
];

if (!$DB->tableExists('ntas_groups_items')) {
    $query = <<<SQL
        CREATE TABLE `ntas_groups_items` (
          `id` int unsigned NOT NULL AUTO_INCREMENT,
          `groups_id` int {$default_key_sign} NOT NULL DEFAULT '0',
          `itemtype` varchar(255) NOT NULL DEFAULT '',
          `items_id` int {$default_key_sign} NOT NULL DEFAULT '0',
          `type` tinyint NOT NULL,
          PRIMARY KEY (`id`),
          UNIQUE KEY `unicity` (`groups_id`,`itemtype`,`items_id`, `type`),
          KEY `item` (`itemtype`, `items_id`),
          KEY `type` (`type`)
        ) ENGINE=InnoDB DEFAULT CHARSET={$default_charset} COLLATE={$default_collation} ROW_FORMAT=DYNAMIC;
SQL;
    $DB->doQuery($query);
}

foreach ($assignable_itemtypes as $itemtype => $specs) {
    $itemtype_table     = $specs['table'];
    $itemtype_rightname = $specs['rightname'];

    $migration->addRight($itemtype_rightname, READ_ASSIGNED, [$itemtype_rightname => READ]);
    $migration->addRight($itemtype_rightname, UPDATE_ASSIGNED, [$itemtype_rightname => UPDATE]);

    // Add missing `users_id`/`users_id_tech` fields on assignable items
    $migration->addField($itemtype_table, 'users_id', 'fkey');
    $migration->addKey($itemtype_table, 'users_id');
    $migration->addField($itemtype_table, 'users_id_tech', 'fkey');
    $migration->addKey($itemtype_table, 'users_id_tech');

    // move groups to the new link table
    if ($DB->fieldExists($itemtype_table, 'groups_id')) {
        $DB->insert('ntas_groups_items', new QuerySubQuery([
            'SELECT' => [
                new QueryExpression('NULL', 'id'),
                'groups_id',
                new QueryExpression($DB::quoteValue($itemtype), 'itemtype'),
                'id AS items_id',
                new QueryExpression('1', 'type'),
            ],
            'FROM'   => $itemtype_table,
            'WHERE'  => [
                'groups_id' => ['>', 0],
            ],
        ]));
    }
    if ($DB->fieldExists($itemtype_table, 'groups_id_tech')) {
        $DB->insert('ntas_groups_items', new QuerySubQuery([
            'SELECT' => [
                new QueryExpression('NULL', 'id'),
                'groups_id_tech AS groups_id',
                new QueryExpression($DB::quoteValue($itemtype), 'itemtype'),
                'id AS items_id',
                new QueryExpression('2', 'type'),
            ],
            'FROM'   => $itemtype_table,
            'WHERE'  => [
                'groups_id_tech' => ['>', 0],
            ],
        ]));
    }

    $migration->dropKey($itemtype_table, 'groups_id');
    $migration->dropKey($itemtype_table, 'groups_id_tech');
    $migration->dropField($itemtype_table, 'groups_id');
    $migration->dropField($itemtype_table, 'groups_id_tech');
}
