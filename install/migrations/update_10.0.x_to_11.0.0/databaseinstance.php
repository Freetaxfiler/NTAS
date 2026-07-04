<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
// The size field seems to be unsused and rather a copy-paste from the ntas_databases table
$migration->dropField('ntas_databaseinstances', 'size');
