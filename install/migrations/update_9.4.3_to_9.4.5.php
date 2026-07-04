<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Update from 9.4.3 to 9.4.5
 *
 * @return bool
 **/
function update943to945()
{
    /**
     * @var DBmysql $DB
     * @var Migration $migration
     */
    global $DB, $migration;

    $updateresult     = true;

    $migration->setVersion('9.4.5');

    /** Add OLA TTR begin date field to Tickets */
    $iterator = new DBmysqlIterator(null);
    $migration->addField(
        'ntas_tickets',
        'ola_ttr_begin_date',
        'datetime',
        [
            'after'     => 'olalevels_id_ttr',
            'update'    => $DB->quoteName('date'), // Assign ticket creation date by default
            'condition' => 'WHERE ' . $iterator->analyseCrit(['NOT' => ['olas_id_ttr' => '0']]),
        ]
    );
    /** /Add OLA TTR begin date field to Tickets */

    /** Fix language fields */
    $translatable_tables = [
        'ntas_dropdowntranslations'             => 'DEFAULT NULL',
        'ntas_knowbaseitemtranslations'         => 'DEFAULT NULL',
        'ntas_notificationtemplatetranslations' => "NOT NULL DEFAULT ''",
        'ntas_knowbaseitems_revisions'          => 'DEFAULT NULL',
        'ntas_knowbaseitems_comments'           => 'DEFAULT NULL',
    ];
    foreach ($translatable_tables as $table => $default) {
        $migration->changeField(
            $table,
            'language',
            'language',
            'varchar(10) COLLATE utf8_unicode_ci ' . $default
        );
        $migration->addPostQuery(
            $DB->buildUpdate(
                $table,
                ['language' => 'es_419'],
                ['language' => 'es_41']
            )
        );
    }
    /** /Fix language fields */

    // ************ Keep it at the end **************
    $migration->executeMigration();

    return $updateresult;
}
