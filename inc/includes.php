<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/** @var int|bool|null $AJAX_INCLUDE */
global $AJAX_INCLUDE;
if (isset($AJAX_INCLUDE)) {
    trigger_error(
        'The global `$AJAX_INCLUDE` variable has no effect anymore.',
        E_USER_WARNING
    );
}

/** @var string|null $SECURITY_STRATEGY */
global $SECURITY_STRATEGY;
if (isset($SECURITY_STRATEGY)) {
    throw new RuntimeException('The global `$SECURITY_STRATEGY` variable has no effect anymore.');
}

/**
 * @var mixed|null $USEDBREPLICATE
 * @var mixed|null $DBCONNECTION_REQUIRED
 */
global $USEDBREPLICATE, $DBCONNECTION_REQUIRED;
if (isset($USEDBREPLICATE) || isset($DBCONNECTION_REQUIRED)) {
    trigger_error(
        'The global `$USEDBREPLICATE` and `$DBCONNECTION_REQUIRED` variables has no effect anymore. Use "DBConnection::getReadConnection()" to get the most apporpriate connection for read only operations.',
        E_USER_WARNING
    );
}

/**
 * @var mixed|null $PLUGINS_EXCLUDED
 * @var mixed|null $PLUGINS_INCLUDED
 */
global $PLUGINS_EXCLUDED, $PLUGINS_INCLUDED;
if (isset($PLUGINS_EXCLUDED) || isset($PLUGINS_INCLUDED)) {
    trigger_error(
        'The global `$PLUGINS_EXCLUDED` and `$PLUGINS_INCLUDED` variables has no effect anymore.',
        E_USER_WARNING
    );
}

/**
 * @var mixed|null $skip_db_check
 */
global $skip_db_check;
if (isset($skip_db_check)) {
    trigger_error(
        'The global `$skip_db_check` variable has no effect anymore.',
        E_USER_WARNING
    );
}

/**
 * @var mixed|null $dont_check_maintenance_mode
 */
global $dont_check_maintenance_mode;
if (isset($dont_check_maintenance_mode)) {
    trigger_error(
        'The global `$dont_check_maintenance_mode` variable has no effect anymore.',
        E_USER_WARNING
    );
}
