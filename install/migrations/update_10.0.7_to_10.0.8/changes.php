<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$default_key_sign = DBConnection::getDefaultPrimaryKeySignOption();
$migration->addField('ntas_changes', 'locations_id', "int {$default_key_sign} NOT NULL DEFAULT '0'");
$migration->addKey('ntas_changes', 'locations_id', 'locations_id');
