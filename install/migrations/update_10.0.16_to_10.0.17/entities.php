<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
// Fix default value for `custom_css_code`
$migration->addPostQuery(
    $DB->buildUpdate(
        'ntas_entities',
        [
            'custom_css_code' => '',
        ],
        [
            'custom_css_code' => null,
        ]
    )
);
