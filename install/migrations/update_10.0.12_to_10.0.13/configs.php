<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->changeField(
    'ntas_users',
    'timeline_action_btn_layout',
    'timeline_action_btn_layout',
    'tinyint DEFAULT NULL'
);

$migration->changeField(
    'ntas_users',
    'timeline_date_format',
    'timeline_date_format',
    'tinyint DEFAULT NULL'
);
