<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
if (!$DB->fieldExists("ntas_cables", "is_template", false)) {
    $migration->addField('ntas_cables', 'is_template', "tinyint NOT NULL DEFAULT '0'", ['after' => 'is_recursive' ]);
    $migration->addKey('ntas_cables', 'is_template');
}

if (!$DB->fieldExists("ntas_cables", "template_name", false)) {
    $migration->addField('ntas_cables', 'template_name', "varchar(255) DEFAULT NULL", ['after' => 'is_template' ]);
}
