<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
if (!$DB->fieldExists("ntas_contacts", "registration_number")) {
    $migration->addField(
        "ntas_contacts",
        "registration_number",
        "string",
        [
            'after'     => "firstname",
        ]
    );
}
