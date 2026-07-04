<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
if (!$DB->fieldExists('ntas_groups_users', 'is_userdelegate')) {
    $migration->addField(
        'ntas_groups_users',
        'is_userdelegate',
        "tinyint NOT NULL DEFAULT '0'",
        ['after' => 'is_manager']
    );
    $migration->addKey(
        'ntas_groups_users',
        'is_userdelegate'
    );
}
