<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

Session::checkRight("reports", READ);

Html::header(Report::getTypeName(Session::getPluralNumber()), '', "tools", "report");

Report::title();
Report::showContractAssetsReport($_GET['item_type'] ?? [], $_GET['year'] ?? []);
Html::footer();
