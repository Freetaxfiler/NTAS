<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var array $ADDTODISPLAYPREF
 * @var Migration $migration
 */
/* Add `last_collect_date` to some ntas_mailcollectors */
$migration->addField('ntas_mailcollectors', 'last_collect_date', 'timestamp');
$migration->addKey('ntas_mailcollectors', 'last_collect_date', 'last_collect_date');
$ADDTODISPLAYPREF['MailCollector'] = [23];
