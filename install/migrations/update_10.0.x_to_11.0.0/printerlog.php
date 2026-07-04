<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->addField('ntas_printerlogs', 'itemtype', 'varchar(100) NOT NULL', ['after' => 'id']);
$migration->changeField('ntas_printerlogs', 'printers_id', 'items_id', 'fkey');
$migration->dropKey('ntas_printerlogs', 'unicity');
$migration->migrationOneTable('ntas_printerlogs');
$migration->addKey('ntas_printerlogs', ['itemtype', 'items_id', 'date'], 'unicity', 'UNIQUE');
