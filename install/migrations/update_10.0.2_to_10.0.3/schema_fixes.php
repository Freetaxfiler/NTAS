<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
// This key may be missing from database on GLPI instances that were migrated to 10.0 version
// prior to #9703 (so prior to 10.0.0-beta).
$migration->addKey('ntas_refusedequipments', 'autoupdatesystems_id');
