<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->addField('ntas_impactrelations', 'name', "string", [
    'after'  => 'id',
    'value' => '',
]);

$migration->addKey('ntas_impactrelations', 'name');
