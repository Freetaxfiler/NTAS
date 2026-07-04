<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->addField(
    'ntas_profiles',
    'last_rights_update',
    'timestamp',
    [
        'null' => false,
        'value' => null,
    ]
);
$migration->addKey('ntas_profiles', 'last_rights_update');

$migration->addField(
    'ntas_profiles',
    'use_mentions',
    'int',
    [
        'null' => false,
        'value' => '1',
        'after' => 'helpdesk_item_type',
    ]
);
