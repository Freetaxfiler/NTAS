<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/* Remove global_validation field from templates (should not be defined manually). */
foreach (['ntas_tickettemplatemandatoryfields', 'ntas_tickettemplatepredefinedfields'] as $table) {
    /**
     * @var DBmysql $DB
     * @var Migration $migration
     */
    $migration->addPostQuery(
        $DB->buildDelete(
            $table,
            [
                'num' => 52, // global_validation
            ]
        )
    );
}
/* /Remove global_validation field from templates (should not be defined manually). */
/* Add dedicated right for ITILFollowupTemplate */
/** @var Migration $migration */
$migration->addRight('itilfollowuptemplate', ALLSTANDARDRIGHT, ['dropdown' => UPDATE]);
/* Add dedicated right for ITILFollowupTemplate */
