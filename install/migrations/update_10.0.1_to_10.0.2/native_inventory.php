<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->addCrontask(
    'Agent',
    'Cleanoldagents',
    DAY_TIMESTAMP,
    options: [
        'comment' => 'Clean old agents',
    ]
);
