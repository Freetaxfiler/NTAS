<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 * @var array $ADDTODISPLAYPREF
 */
if (!$DB->fieldExists('ntas_states', 'is_visible_unmanaged')) {
    $migration->addField('ntas_states', 'is_visible_unmanaged', 'bool', [
        'value' => 1,
        'after' => 'is_visible_cable',
    ]);
}
$migration->addKey('ntas_states', 'is_visible_unmanaged');
