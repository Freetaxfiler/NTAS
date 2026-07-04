<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
// Change action type for "itilfollowup_template" and "task_template"
$query = $DB->buildUpdate(
    "ntas_ruleactions",
    [
        "action_type" => "append",
    ],
    [
        "action_type" => "assign",
        "OR" => [
            ["field" => "itilfollowup_template"],
            ["field" => "task_template"],
        ],
    ]
);
$migration->addPostQuery($query);
