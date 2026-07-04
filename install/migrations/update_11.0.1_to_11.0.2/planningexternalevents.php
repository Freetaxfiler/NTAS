<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

use function Safe\json_decode;
use function Safe\json_encode;

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
$events = $DB->request([
    'FROM' => 'ntas_planningexternalevents',
    'WHERE' => [
        'NOT' => ['users_id_guests' => '[]'],
    ],
]);

foreach ($events as $event) {
    $event_id = $event['id'];

    try {
        $guests = json_decode($event['users_id_guests']);
        if (!is_array($guests)) {
            $guests = [];
        }
    } catch (Throwable $e) {
        $guests = [];
    }

    $normalized_guests = [];
    foreach ($guests as $guest) {
        $guest = (int) $guest;
        if ($guest > 0) {
            $normalized_guests[] = $guest;
        }
    }

    $migration->addPostQuery(
        $DB->buildUpdate(
            'ntas_planningexternalevents',
            [
                'users_id_guests' => json_encode($normalized_guests),
            ],
            [
                'id' => $event_id,
            ]
        )
    );
}
