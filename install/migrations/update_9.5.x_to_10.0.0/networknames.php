<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$default_key_sign = DBConnection::getDefaultPrimaryKeySignOption();

$migration->addField('ntas_networknames', 'ipnetworks_id', "int {$default_key_sign} NOT NULL DEFAULT '0'", [
    'after' => 'fqdns_id',
]);
$migration->addKey('ntas_networknames', 'ipnetworks_id', 'ipnetworks_id');
