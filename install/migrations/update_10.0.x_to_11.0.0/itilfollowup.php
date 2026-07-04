<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
// new right values for task
$migration->giveRight(
    'followup',
    // ITILFollowup::ADD_AS_TECHNICIAN,
    32768,
    [
        'ticket' => 32768, // Ticket::OWN
    ]
);
