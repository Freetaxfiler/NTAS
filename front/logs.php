<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

use Glpi\System\Log\LogViewer;

Session::checkRight(LogViewer::$rightname, READ);

Html::header(
    LogViewer::getTypeName(Session::getPluralNumber()),
    '',
    "admin",
    'glpi\system\log\logviewer'
);

$logviewer = new LogViewer();
$logviewer->displayList(
    $_GET['order'] ?? "filename",
    $_GET['sort']  ?? "asc"
);

Html::footer();
