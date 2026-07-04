<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
if (!$DB->fieldExists("ntas_solutiontypes", "is_incident")) {
    $migration->addField('ntas_solutiontypes', 'is_incident', 'bool', ['value' => 1]);
    $migration->addKey('ntas_solutiontypes', 'is_incident');
}
if (!$DB->fieldExists("ntas_solutiontypes", "is_request")) {
    $migration->addField('ntas_solutiontypes', 'is_request', 'bool', ['value' => 1]);
    $migration->addKey('ntas_solutiontypes', 'is_request');
}
if (!$DB->fieldExists("ntas_solutiontypes", "is_change")) {
    $migration->addField('ntas_solutiontypes', 'is_change', 'bool', ['value' => 1]);
    $migration->addKey('ntas_solutiontypes', 'is_change');
}
if (!$DB->fieldExists("ntas_solutiontypes", "is_problem")) {
    $migration->addField('ntas_solutiontypes', 'is_problem', 'bool', ['value' => 1]);
    $migration->addKey('ntas_solutiontypes', 'is_problem');
}
