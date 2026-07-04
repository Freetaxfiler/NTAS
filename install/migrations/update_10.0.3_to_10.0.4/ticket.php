<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
if (!$DB->fieldExists("ntas_tickets", "takeintoaccountdate")) {
    $migration->addField("ntas_tickets", "takeintoaccountdate", "timestamp", ['null' => true,'after' => 'solvedate']);
    $migration->addKey("ntas_tickets", "takeintoaccountdate");
    $migration->migrationOneTable("ntas_tickets");
}
