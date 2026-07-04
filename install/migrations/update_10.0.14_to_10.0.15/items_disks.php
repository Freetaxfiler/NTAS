<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->changeField('ntas_items_disks', 'totalsize', 'totalsize', 'bigint NOT NULL DEFAULT "0"');
$migration->changeField('ntas_items_disks', 'freesize', 'freesize', 'bigint NOT NULL DEFAULT "0"');
