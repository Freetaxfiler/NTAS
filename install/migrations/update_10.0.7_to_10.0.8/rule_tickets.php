<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 */
$DB->update(
    'ntas_rulecriterias',
    [
        'criteria' => '_locations_id_of_item',
    ],
    [
        'criteria' => 'items_locations',
    ]
);
