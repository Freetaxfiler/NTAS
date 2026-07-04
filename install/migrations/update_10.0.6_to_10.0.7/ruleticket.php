<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 */
// Replace old rule criteria itilcategories_id_cn
$DB->update(
    'ntas_rulecriterias',
    [
        'criteria' => 'itilcategories_id',
    ],
    [
        'criteria' => 'itilcategories_id_cn',
    ]
);
