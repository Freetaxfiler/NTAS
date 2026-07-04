<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 * @var DBmysql $DB
 */
$default_key_sign = DBConnection::getDefaultPrimaryKeySignOption();

if ($DB->fieldExists('ntas_softwarelicenses', 'softwares_id')) {
    $migration->changeField(
        'ntas_softwarelicenses',
        'softwares_id',
        'softwares_id',
        "int {$default_key_sign}",
        [
            'null' => true,
        ]
    );
}
