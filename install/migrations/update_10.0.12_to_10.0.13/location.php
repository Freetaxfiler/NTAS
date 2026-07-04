<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->addField('ntas_items_devicecameras', 'locations_id', "fkey", [
    'after'  => 'is_recursive',
]);
$migration->addKey('ntas_items_devicecameras', 'locations_id');
