<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Update from 9.1.1 to 9.1.3
 *
 * @return bool
 **/
function update911to913()
{
    /**
     * @var DBmysql $DB
     * @var Migration $migration
     */
    global $DB, $migration;

    $updateresult     = true;

    $migration->setVersion('9.1.3');

    //Fix duplicated search options
    if (countElementsInTable("ntas_displaypreferences", ['itemtype' => 'IPNetwork', 'num' => '17']) == 0) {
        $DB->update(
            "ntas_displaypreferences",
            [
                "num" => 17,
            ],
            [
                'itemtype'  => "IPNetwork",
                'num'       => 13,
            ]
        );
    }
    if (countElementsInTable("ntas_displaypreferences", ['itemtype' => 'IPNetwork', 'num' => '18']) == 0) {
        $DB->update(
            "ntas_displaypreferences",
            [
                "num" => 18,
            ],
            [
                'itemtype'  => "IPNetwork",
                'num'       => 14,
            ]
        );
    }

    $migration->addField(
        "ntas_softwarelicenses",
        "contact",
        "varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL"
    );
    $migration->addField(
        "ntas_softwarelicenses",
        "contact_num",
        "varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL"
    );

    // ************ Keep it at the end **************
    $migration->executeMigration();

    return $updateresult;
}
