<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
$migration->addPostQuery(
    $DB->buildUpdate(
        'ntas_rulecriterias',
        [
            'pattern' => '/(.*)[,|\/]/',
        ],
        [
            'id' => 19,
            'pattern' => '/(.*),/',
        ]
    )
);
