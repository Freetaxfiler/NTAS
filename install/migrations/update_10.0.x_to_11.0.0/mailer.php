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
    $DB->buildUpdate(
        Config::getTable(),
        [
            'value' => 1, // MAIL_SMTP
        ],
        [
            'context' => 'core',
            'name' => 'smtp_mode',
            'value' => 2, // deprecated MAIL_SMTPSSL
        ]
    )
);
