<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

use Glpi\DBAL\QueryExpression;

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
// Drop the ancestors/sons cache that may have been corrupted by bugs that have now been resolved.
$tree_dropdown_tables = [
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
foreach ($tree_dropdown_tables as $table) {
    $migration->addPostQuery(
        $DB->buildUpdate(
            $table,
            [
                'ancestors_cache' => null,
                'sons_cache' => null,
            ],
            [
                new QueryExpression('true'),
            ]
        )
    );
}
