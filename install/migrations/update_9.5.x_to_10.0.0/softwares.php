<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
// CleanSoftwareCron cron task
$migration->addCrontask(
    'CleanSoftwareCron',
    'cleansoftware',
    MONTH_TIMESTAMP,
    param: 1000,
    options: [
        'state' => 0, // CronTask::STATE_DISABLE
        'logs_lifetime' => 300,
    ]
);
// /CleanSoftwareCron cron task

// Add architecture to software versions
if (!$DB->fieldExists('ntas_softwareversions', 'arch', false)) {
    $migration->addField(
        'ntas_softwareversions',
        'arch',
        'string',
        [
            'after' => 'name',
        ]
    );
    $migration->addKey('ntas_softwareversions', 'arch');
}
// /Add architecture to software versions
