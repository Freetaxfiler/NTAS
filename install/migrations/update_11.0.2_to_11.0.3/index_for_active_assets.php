<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */

$assets_tables_with_templates_and_trashbin = [
    'ntas_budgets',
    'ntas_certificates',
    'ntas_computers',
    'ntas_contracts',
    'ntas_domains',
    'ntas_cables',
    'ntas_monitors',
    'ntas_networkequipments',
    'ntas_passivedcequipments',
    'ntas_peripherals',
    'ntas_phones',
    'ntas_printers',
    'ntas_projects',
    'ntas_projecttasks',
    'ntas_softwarelicenses',
    'ntas_softwares',
    'ntas_racks',
    'ntas_enclosures',
    'ntas_pdus',
    'ntas_assets_assets',
];

foreach ($assets_tables_with_templates_and_trashbin as $table) {
    $migration->addKey($table, ['is_deleted', 'is_template'], 'active_assets');
    $migration->dropKey($table, 'is_deleted');
}
