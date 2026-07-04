<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->addField('ntas_cartridgeitems', 'stock_target', 'int', [
    'value'  => 0,
    'after'  => 'alarm_threshold',
]);

$migration->addField('ntas_consumableitems', 'stock_target', 'int', [
    'value'  => 0,
    'after'  => 'alarm_threshold',
]);
