<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
if (!$DB->fieldExists("ntas_dcrooms", "vis_cell_width")) {
    $migration->addField(
        "ntas_dcrooms",
        "vis_cell_width",
        "int",
        [
            'after'  => "vis_rows",
            'value'  => 40,
        ]
    );
}
if (!$DB->fieldExists("ntas_dcrooms", "vis_cell_height")) {
    $migration->addField(
        "ntas_dcrooms",
        "vis_cell_height",
        "int",
        [
            'after'  => "vis_cell_width",
            'update' => 39,
            'value'  => 40,
        ]
    );
}
