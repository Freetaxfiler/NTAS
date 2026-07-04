<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Update from 0.85.5 to 0.90
 *
 * @return bool
 **/
function update085xto0900()
{
    /**
     * @var DBmysql $DB
     * @var Migration $migration
     */
    global $DB, $migration;

    $updateresult     = true;

    $migration->setVersion('0.90');

    // Add Color selector
    $migration->addConfig(['palette' => 'auror']);
    $migration->addField("ntas_users", "palette", "char(20) DEFAULT NULL");

    // add layout config
    $migration->addConfig(['layout' => 'lefttab']);
    $migration->addField("ntas_users", "layout", "char(20) DEFAULT NULL");

    // add timeline config
    $migration->addConfig([
        'ticket_timeline' => 1,
        'ticket_timeline_keep_replaced_tabs' => 0,
    ]);
    $migration->addField("ntas_users", "ticket_timeline", "tinyint DEFAULT NULL");
    $migration->addField("ntas_users", "ticket_timeline_keep_replaced_tabs", "tinyint DEFAULT NULL");

    // clean unused parameter
    $migration->dropField("ntas_users", "dropdown_chars_limit");
    $migration->removeConfig(['dropdown_chars_limit']);

    // change type of field solution in ticket.change and problem
    $migration->changeField('ntas_tickets', 'solution', 'solution', 'longtext');
    $migration->changeField('ntas_changes', 'solution', 'solution', 'longtext');
    $migration->changeField('ntas_problems', 'solution', 'solution', 'longtext');

    // must always be at the end
    $migration->executeMigration();

    return $updateresult;
}
