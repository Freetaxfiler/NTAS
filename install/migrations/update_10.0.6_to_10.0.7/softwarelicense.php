<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
if (!$DB->fieldExists('ntas_softwarelicenses', 'ancestors_cache')) {
    $migration->addField('ntas_softwarelicenses', 'ancestors_cache', 'longtext');
}

if (!$DB->fieldExists('ntas_softwarelicenses', 'sons_cache')) {
    $migration->addField('ntas_softwarelicenses', 'sons_cache', 'longtext');
}
