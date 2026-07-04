<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->changeField(
    NetworkPortFiberchannel::getTable(),
    'wwn',
    'wwn',
    "varchar(50) DEFAULT ''",
);
