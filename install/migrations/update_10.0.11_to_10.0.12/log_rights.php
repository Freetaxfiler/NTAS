<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
// Grant READ right to system_logs to everyone who has READ and UPDATE 'config' rights already
$migration->addRight('system_logs', READ);
