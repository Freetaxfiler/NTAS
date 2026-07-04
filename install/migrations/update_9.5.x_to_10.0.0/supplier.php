<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
if (!$DB->fieldExists("ntas_suppliers", "registration_number")) {
    $migration->addField(
        "ntas_suppliers",
        "registration_number",
        "string",
        [
            'after'     => "suppliertypes_id",
        ]
    );
}
