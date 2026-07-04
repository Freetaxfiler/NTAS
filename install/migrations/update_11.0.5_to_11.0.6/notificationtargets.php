<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */

// Remove duplicates targets
$duplicates_targets_iterator = $DB->request([
    'SELECT' => [
        'notifications_id',
        'items_id',
        'type',
        'MIN' => 'id AS min_id',
        'COUNT' => '* AS count',
    ],
    'FROM' => 'ntas_notificationtargets',
    'GROUPBY' => ['notifications_id', 'items_id', 'type'],
    'HAVING' => ['count' => ['>', 1]],
]);

foreach ($duplicates_targets_iterator as $target) {
    $DB->delete('ntas_notificationtargets', [
        'notifications_id' => $target['notifications_id'],
        'items_id' => $target['items_id'],
        'type' => $target['type'],
        'id' => ['>', $target['min_id']],
    ]);
}

$migration->dropKey('ntas_notificationtargets', 'notifications_id');
$migration->addKey('ntas_notificationtargets', ['notifications_id', 'items_id', 'type'], 'unicity', 'UNIQUE');
