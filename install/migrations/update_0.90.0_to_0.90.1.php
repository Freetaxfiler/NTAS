<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Update from 0.90 to 0.90.1
 *
 * @return bool
 **/
function update0900to0901()
{
    /**
     * @var DBmysql $DB
     * @var Migration $migration
     */
    global $DB, $migration;

    $updateresult     = true;

    $migration->setVersion('0.90.1');

    // Add missing fill in 0.90 empty version
    $migration->addField("ntas_entities", 'inquest_duration', "integer", ['value' => 0]);

    // ************ Keep it at the end **************
    $migration->executeMigration();

    return $updateresult;
}
