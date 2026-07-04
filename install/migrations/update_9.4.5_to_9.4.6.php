<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Update from 9.4.5 to 9.4.6
 *
 * @return bool
 **/
function update945to946()
{
    /**
     * @var DBmysql $DB
     * @var Migration $migration
     */
    global $DB, $migration;
    $updateresult     = true;
    $migration->setVersion('9.4.6');
    $DB->delete(
        'ntas_profilerights',
        [
            'name'  => 'backup',
        ]
    );
    // ************ Keep it at the end **************
    $migration->executeMigration();
    return $updateresult;
}
