<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
if (countElementsInTable(Blacklist::getTable(), ["type" => Blacklist::IP, "value" => "::1"]) === 0) {
    $migration->addPostQuery(
        $DB->buildInsert(
            'ntas_blacklists',
            [
                'name'      => 'IPV6 localhost',
                'value' => '::1',
                'type' => Blacklist::IP,
            ]
        )
    );
}
