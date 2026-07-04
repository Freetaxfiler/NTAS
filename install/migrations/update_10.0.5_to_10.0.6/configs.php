<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->addConfig([
    'timeline_action_btn_layout'   => 0,
    'timeline_date_format'   => 0,
]);
$migration->addField('ntas_users', 'timeline_action_btn_layout', 'tinyint DEFAULT 0');
$migration->addField('ntas_users', 'timeline_date_format', 'tinyint DEFAULT 0');
