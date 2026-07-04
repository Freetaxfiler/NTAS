<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->addConfig([
    'planning_work_days' => exportArrayToDB([0, 1, 2, 3, 4, 5, 6]),
]);
