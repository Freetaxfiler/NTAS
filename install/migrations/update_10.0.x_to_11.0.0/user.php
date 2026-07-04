<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
if (!$DB->fieldExists('ntas_users', 'is_notif_enable_default')) {
    $migration->addField('ntas_users', 'is_notif_enable_default', "tinyint DEFAULT NULL");
}

$migration->addConfig(['is_notif_enable_default' => 1]);

// search ux improvements (#15861)
$migration->addField('ntas_users', 'show_search_form', "tinyint DEFAULT NULL");
$migration->addField('ntas_users', 'search_pagination_on_top', "tinyint DEFAULT NULL");
$migration->dropField('ntas_users', 'fold_search');

$migration->addConfig(['show_search_form' => 0]);
$migration->addConfig(['search_pagination_on_top' => 0]);
$migration->removeConfig(['fold_search']);

// Drop useless field
$migration->dropField('ntas_users', 'display_options');

// Drop "picture" search option
$migration->removeSearchOption('User', 150);
