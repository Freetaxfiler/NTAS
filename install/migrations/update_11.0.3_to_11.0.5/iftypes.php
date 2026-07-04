<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */

//remove wrong iftype entry (was a CSV file header)
$DB->delete(
    'ntas_networkporttypes',
    [
        'name' => 'Name',
        'comment' => 'Description References',
    ]
);
