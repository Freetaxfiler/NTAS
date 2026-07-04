<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

use Glpi\DBAL\QueryExpression;

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
// Add user_dn_hash field
$migration->addField('ntas_users', 'user_dn_hash', 'varchar(32)', [
    'after'  => 'user_dn',
]);

$migration->addPostQuery($DB->buildUpdate(
    'ntas_users',
    [
        'user_dn_hash' => new QueryExpression('MD5(`user_dn`)'),
    ],
    [
        'NOT' => [
            'user_dn' => null,
        ],
    ]
));

// Add user_dn_hash index
$migration->addKey('ntas_users', 'user_dn_hash');
