<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$table = "ntas_authldaps";
$migration->addField($table, "begin_date_field", "string");
$migration->addField($table, "end_date_field", "string");

$migration->dropField($table, 'entity_field');
$migration->dropField($table, 'entity_condition');
