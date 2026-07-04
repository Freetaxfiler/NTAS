<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
// Add certificate entry for transfers.
$migration->addField('ntas_transfers', 'keep_certificate', "int NOT NULL DEFAULT '0'", [
    'update' => "'1'",
]);
$migration->addField('ntas_transfers', 'clean_certificate', "int NOT NULL DEFAULT '0'", [
    'update' => "'1'",
]);
