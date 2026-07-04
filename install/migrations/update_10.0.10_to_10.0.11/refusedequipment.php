<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->changeField(
    RefusedEquipment::getTable(),
    'ip',
    'ip',
    "text"
);

$migration->changeField(
    RefusedEquipment::getTable(),
    'mac',
    'mac',
    "text"
);
