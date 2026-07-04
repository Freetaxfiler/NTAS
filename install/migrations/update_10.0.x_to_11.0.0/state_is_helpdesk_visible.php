<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->addField('ntas_states', 'is_helpdesk_visible', 'bool', ['value' => 1]);
$migration->addKey('ntas_states', 'is_helpdesk_visible');
