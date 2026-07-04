<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
// see #21511
$existing = $DB->request([
    'SELECT' => 'id',
    'FROM'   => 'ntas_documenttypes',
    'WHERE'  => [
        'ext'    => 'webp',
    ],
]);

if ($existing->numrows() == 0) {
    $migration->addPostQuery(
        $DB->buildInsert(
            'ntas_documenttypes',
            [
                'name' => 'WebP',
                'ext' => 'webp',
                'icon' => 'webp-dist.png',
            ]
        )
    );
}
