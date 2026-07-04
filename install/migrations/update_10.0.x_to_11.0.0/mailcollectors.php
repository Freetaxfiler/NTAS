<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->addField('ntas_mailcollectors', 'create_user_from_email', 'bool', ['value' => 0]);
$migration->addField('ntas_mailcollectors', 'add_to_to_observer', 'bool', ['value' => 1]);
