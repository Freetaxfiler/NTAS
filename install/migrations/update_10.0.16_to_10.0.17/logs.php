<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
$migration->addPostQuery(
    $DB->buildDelete(
        'ntas_logs',
        [
            'itemtype' => 'MailCollector',
            'id_search_option' => [22, 23], // errors and last_collect_date
        ],
    )
);
