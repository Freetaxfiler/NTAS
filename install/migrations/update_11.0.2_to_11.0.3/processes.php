<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
// see #21349
$migration->changeField('ntas_items_processes', 'virtualmemory', 'virtualmemory', 'bigint NOT NULL DEFAULT "0"');
