<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->changeField('ntas_tickettemplatepredefinedfields', 'value', 'value', 'longtext', ['nodefault' => true]);
$migration->changeField('ntas_changetemplatepredefinedfields', 'value', 'value', 'longtext', ['nodefault' => true]);
$migration->changeField('ntas_problemtemplatepredefinedfields', 'value', 'value', 'longtext', ['nodefault' => true]);
