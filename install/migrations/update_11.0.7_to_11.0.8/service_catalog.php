<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */

if (!$DB->fieldExists('ntas_entities', 'service_catalog_default_sort_strategy')) {
    $migration->addField(
        'ntas_entities',
        'service_catalog_default_sort_strategy',
        "varchar(255) NOT NULL DEFAULT '-2'"
    );
    $migration->addPostQuery(
        $DB->buildUpdate(
            'ntas_entities',
            ['service_catalog_default_sort_strategy' => 'popularity'],
            ['id' => 0]
        )
    );
}
