<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
$migration->giveRight('ticket', Ticket::READNEWTICKET, [
    'ticket' => Ticket::ASSIGN,
]);

if (!$DB->fieldExists('ntas_tickets', 'externalid')) {
    $migration->addField('ntas_tickets', 'externalid', 'string', [
        'null' => true,
    ]);
}
