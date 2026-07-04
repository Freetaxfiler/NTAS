<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

use Glpi\Inventory\Conf;

/**
 * @var Migration $migration
 */
//new right value for inventory
$migration->replaceRight('inventory', READ | Conf::IMPORTFROMFILE | Conf::UPDATECONFIG, ['config' => UPDATE, 'inventory' => READ]);
