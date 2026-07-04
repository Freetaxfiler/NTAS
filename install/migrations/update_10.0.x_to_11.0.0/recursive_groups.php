<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
// Add new "recursive_membership" field on groups
// If enabled, members of a given group will become implicits members of its
// children groups
// Disabled by default
if (!$DB->fieldExists('ntas_groups', 'recursive_membership')) {
    $migration->addField('ntas_groups', 'recursive_membership', 'bool', [
        'value' => 0,
    ]);
}
