<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->changeField('ntas_dashboards_items', 'card_id', 'card_id', 'varchar(255) NOT NULL');
$migration->changeField('ntas_dashboards_items', 'gridstack_id', 'gridstack_id', 'varchar(255) NOT NULL');
