<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

Session::checkRight("config", UPDATE);

$config = new Config();

Html::header(
    __('External authentication sources'),
    '',
    "config",
    "auth",
    "settings"
);
$config->showFormAuthentication();

Html::footer();
