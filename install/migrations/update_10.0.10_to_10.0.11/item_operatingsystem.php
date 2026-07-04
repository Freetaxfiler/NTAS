<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->addField('ntas_items_operatingsystems', 'company', "varchar(255) NULL DEFAULT NULL");
$migration->addField('ntas_items_operatingsystems', 'owner', "varchar(255) NULL DEFAULT NULL");
$migration->addField('ntas_items_operatingsystems', 'hostid', "varchar(255) NULL DEFAULT NULL");
