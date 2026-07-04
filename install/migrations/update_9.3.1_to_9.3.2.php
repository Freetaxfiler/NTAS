<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/** @file
 * @brief
 */

/**
 * Update from 9.3.1 to 9.3.2
 *
 * @return bool
 **/
function update931to932()
{
    /**
     * @var DBmysql $DB
     * @var Migration $migration
     */
    global $DB, $migration;

    $updateresult     = true;

    $migration->setVersion('9.3.2');

    /** Clean rack/enclosure items corrupted relations */
    $corrupted_criteria = [
        'OR' => [
            'itemtype' => 0,
            'items_id' => 0,
        ],
    ];
    $DB->delete(Item_Rack::getTable(), $corrupted_criteria);
    $DB->delete(Item_Enclosure::getTable(), $corrupted_criteria);
    /** /Clean rack/enclosure items corrupted relations */

    // limit state visibility for enclosures and pdus
    $migration->addField('ntas_states', 'is_visible_enclosure', 'bool', [
        'value' => 1,
        'after' => 'is_visible_rack',
    ]);
    $migration->addField('ntas_states', 'is_visible_pdu', 'bool', [
        'value' => 1,
        'after' => 'is_visible_enclosure',
    ]);
    $migration->addKey('ntas_states', 'is_visible_enclosure');
    $migration->addKey('ntas_states', 'is_visible_pdu');

    // ************ Keep it at the end **************
    $migration->executeMigration();

    return $updateresult;
}
