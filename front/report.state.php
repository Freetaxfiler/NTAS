<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

/**
 * @since 0.84
 */

Session::checkRight("reports", READ);

Html::header(Report::getTypeName(Session::getPluralNumber()), '', "tools", "report");

if (!isset($_GET["id"])) {
    $_GET["id"] = 0;
}

Report::title();
State::showSummary();
Html::footer();
