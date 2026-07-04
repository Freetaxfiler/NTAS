<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
// Add index on level on all TreeDropdown tables
$tables = [
    'ntas_businesscriticities',
    'ntas_documentcategories',
    'ntas_entities',
    'ntas_groups',
    'ntas_ipnetworks',
    'ntas_itilcategories',
    'ntas_knowbaseitemcategories',
    'ntas_locations',
    'ntas_softwarecategories',
    'ntas_softwarelicenses',
    'ntas_softwarelicensetypes',
    'ntas_states',
    'ntas_taskcategories',
];

foreach ($tables as $table) {
    $migration->addKey($table, 'level');
}
