<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */

/** Impact Relations improvements */

$migration->changeField('ntas_impactcontexts', 'positions', 'positions', 'mediumtext', [
    'after' => 'id',
    'value' => '',
]);
