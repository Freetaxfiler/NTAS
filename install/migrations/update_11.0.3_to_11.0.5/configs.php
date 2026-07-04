<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
$migration->addConfig(
    [
        'found_new_version'         => '',
        'proxy_exclusions'          => exportArrayToDB([]),
        'must_unsanitize_db_data'   => 1,
    ]
);

$migration->removeConfig(['founded_new_version']);

$migration->addPostQuery(
    $DB->buildUpdate(
        'ntas_configs',
        ['value' => '0'],
        [
            'context' => 'core',
            'name'    => 'timezone',
            'value'   => null,
        ]
    )
);
