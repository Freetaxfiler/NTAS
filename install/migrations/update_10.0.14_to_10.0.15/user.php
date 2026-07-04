<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
// Fix user_dn_hash related to `user_dn` containing a special char
$users_iterator = $DB->request(
    [
        'SELECT' => ['id', 'user_dn'],
        'FROM'   => 'ntas_users',
        'WHERE'  => [
            // `user_dn` will contains a `&` char if any of its char was sanitized
            'user_dn' => ['LIKE', '%&%'],
        ],
    ]
);
foreach ($users_iterator as $user_data) {
    $migration->addPostQuery(
        $DB->buildUpdate(
            'ntas_users',
            [
                'user_dn_hash' => md5($user_data['user_dn']),
            ],
            [
                'id' => $user_data['id'],
            ]
        )
    );
}
