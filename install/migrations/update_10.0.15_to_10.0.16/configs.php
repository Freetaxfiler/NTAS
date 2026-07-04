<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
// Drop unexpected values related to SQL Replication
$migration->removeConfig([
    '_dbslave_status',
    '_dbreplicate_dbhost',
    '_dbreplicate_dbuser',
    '_dbreplicate_dbpassword',
    '_dbreplicate_dbdefault',
]);
