<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
// Add pendingreasons_id field
$migration->addField("ntas_tasktemplates", "pendingreasons_id", "fkey");
$migration->addKey("ntas_tasktemplates", "pendingreasons_id");

// Add dedicated right
$migration->addRight('tasktemplate', READ, ['taskcategory' => READ]);
$migration->replaceRight('tasktemplate', READ | UPDATE, ['taskcategory' => UPDATE]);
$migration->replaceRight('tasktemplate', READ | UPDATE | CREATE, ['taskcategory' => CREATE]);
$migration->replaceRight('tasktemplate', READ | UPDATE | CREATE | PURGE, ['taskcategory' => PURGE]);
