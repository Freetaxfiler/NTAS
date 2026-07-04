<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
$migration->addField(
    'ntas_tasktemplates',
    'use_current_user',
    'bool',
    [
        'after' => 'users_id_tech',
    ]
);
