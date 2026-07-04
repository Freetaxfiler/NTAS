<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
global $DB, $migration;

// Attach existing mail configuration settings log to NotificationMailingSetting object
$or_criteria = [];
foreach (NotificationMailingSetting::getRelatedConfigKeys() as $field) {
    // `old_value` starts with the field name, followed by a space, then the field value
    $or_criteria[] = [
        'old_value' => ['LIKE', $field . '\\ %'],
    ];
}
$migration->addPostQuery(
    $DB->buildUpdate(
        'ntas_logs',
        [
            'itemtype' => 'NotificationMailingSetting',
            'id_search_option' => 1,
        ],
        [
            'itemtype' => 'Config',
            'OR' => $or_criteria,
        ]
    )
);
