<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var array $ADDTODISPLAYPREF
 * @var DBmysql $DB
 * @var Migration $migration
 */
if (!$DB->fieldExists("ntas_lockedfields", "is_global", false)) {
    $migration->addField('ntas_lockedfields', 'is_global', "tinyint NOT NULL DEFAULT '0'", ['after' => 'date_creation' ]);
    $migration->addKey('ntas_lockedfields', 'is_global');
}

$ADDTODISPLAYPREF['Lockedfield'] = [7];
