<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
$text_cols = [
    ['ntas_notificationtemplatetranslations', 'content_text', 'longtext'],
    ['ntas_notificationtemplatetranslations', 'content_html', 'longtext'],
    ['ntas_items_kanbans', 'state', 'mediumtext'],
];

foreach ($text_cols as $data) {
    [$table, $column, $type] = $data;
    $migration->changeField($table, $column, $column, $type);
}
