<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$rich_text_fields = [
    'ntas_itilfollowuptemplates'          => 'content',
    'ntas_planningexternaleventtemplates' => 'text',
    // already a longtext 'ntas_projecttasktemplates'           => 'description',
    'ntas_solutiontemplates'              => 'content',
    'ntas_tasktemplates'                  => 'content',
];
foreach ($rich_text_fields as $table => $field) {
    $migration->changeField(
        $table,
        $field,
        $field,
        'mediumtext',
    );
}
