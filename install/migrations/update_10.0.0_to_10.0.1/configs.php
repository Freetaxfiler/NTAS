<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
use Glpi\Agent\Communication\AbstractRequest;

$migration->addPreQuery(
    $DB->buildUpdate(
        Config::getTable(),
        [
            'context' => 'inventory',
        ],
        [
            'name' => 'inventory_frequency',
            'context' => 'core',
        ]
    )
);
$migration->addConfig(
    ['inventory_frequency' => AbstractRequest::DEFAULT_FREQUENCY],
    'inventory'
);
