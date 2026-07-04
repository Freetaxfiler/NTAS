<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
// Drop useless field
$migration->dropKey('ntas_ticketrecurrents', 'is_recursive');
$migration->dropField('ntas_ticketrecurrents', 'is_recursive');
