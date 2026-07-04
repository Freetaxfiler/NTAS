<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->addConfig([
    'use_flat_dropdowntree_on_search_result'   => 1,
]);
$migration->addField('ntas_users', 'use_flat_dropdowntree_on_search_result', 'tinyint DEFAULT NULL');
