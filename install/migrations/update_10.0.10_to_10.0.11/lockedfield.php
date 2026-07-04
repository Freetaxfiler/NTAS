<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
//lockedfield previous value must be null for global lock
$migration->addPostQuery(
    $DB->buildUpdate(
        'ntas_lockedfields',
        [
            'value' => null,
        ],
        [
            'is_global' => 1,
        ]
    )
);

//global lock on entities_id should not / no longer exist
$migration->addPostQuery(
    $DB->buildDelete(
        'ntas_lockedfields',
        [
            'is_global' => 1,
            'field' => 'entities_id',
        ]
    )
);
