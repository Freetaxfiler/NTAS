<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DB $DB
 * @var Migration $migration
 */

$default_key_sign = DBConnection::getDefaultPrimaryKeySignOption();

$migration->addField(
    "ntas_logs",
    "new_id",
    "int {$default_key_sign}",
    [
        "null" => true,
    ]
);

$migration->addField(
    "ntas_logs",
    "old_id",
    "int {$default_key_sign}",
    [
        "null" => true,
    ]
);

// First migrate only column changes so MySQL/MariaDB can optimize the ALTER TABLE query to perform only metadata changes rather than a rebuild
$migration->migrationOneTable("ntas_logs");

// Then create indexes in a separate step to significantly reduce migration time on large tables
// (about 2 minutes instead of 30 minutes for a 15 GB table).
$migration->addKey("ntas_logs", "new_id");
$migration->addKey("ntas_logs", "old_id");
