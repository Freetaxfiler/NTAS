<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
// Remove '' default values on ntas_impactcontexts.positions
// MySQL does not allow default values on TEXT fields, while MariaDB does
// Default was removed in installation file GLPI 9.5.4, see #8415
$migration->changeField('ntas_impactcontexts', 'positions', 'positions', 'mediumtext NOT NULL');
