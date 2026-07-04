<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
// Fix default value for `autopurge_delay`
$migration->changeField('ntas_entities', 'autopurge_delay', 'autopurge_delay', "int NOT NULL DEFAULT '-2'");

// Fix root entity config value if its value is inherited (-2)
$root_defaults = [
    'use_domains_alert' => 0,
    'send_domains_alert_close_expiries_delay' => 30,
    'send_domains_alert_expired_delay' => 1,
];
foreach ($root_defaults as $key => $default) {
    $current_value = $DB->request(['SELECT' => $key, 'FROM' => 'ntas_entities', 'WHERE' => ['id' => 0]])->current()[$key];
    if ($current_value === -2) {
        $migration->addPostQuery(
            $DB->buildUpdate(
                'ntas_entities',
                [
                    $key => $default,
                ],
                [
                    'id' => 0,
                ]
            )
        );
    }
}
