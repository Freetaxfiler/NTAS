<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->addField('ntas_locations', 'code', 'string', ['after' => 'name']);
$migration->addField('ntas_locations', 'alias', 'string', ['after' => 'code']);
