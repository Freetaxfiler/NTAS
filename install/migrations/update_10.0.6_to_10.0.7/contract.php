<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$default_key_sign = DBConnection::getDefaultPrimaryKeySignOption();
$migration->addField('ntas_contracts', 'locations_id', "int {$default_key_sign} NOT NULL DEFAULT '0'", ['after' => 'contracttypes_id']);
$migration->addKey('ntas_contracts', 'locations_id', 'locations_id');
