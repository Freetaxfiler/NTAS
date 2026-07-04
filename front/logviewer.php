<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

use Glpi\Exception\Http\NotFoundHttpException;
use Glpi\System\Log\LogParser;
use Glpi\System\Log\LogViewer;

global $CFG_GLPI;

Session::checkRight(LogViewer::$rightname, READ);

$filepath = $_REQUEST['filepath'] ?? null;

if ($filepath === null) {
    Html::redirect($CFG_GLPI["root_doc"] . "/front/logs.php");
}

$logparser = new LogParser();
if ($logparser->getFullPath($filepath) === null) {
    throw new NotFoundHttpException('Not found');
}

if (($_GET['action'] ?? '') === 'download_log_file') {
    $logparser = new LogParser();
    $logparser->download($filepath);
} elseif (($_POST['action'] ?? '') === 'empty') {
    Session::checkRight(Config::$rightname, UPDATE); // no UPDATE right for LogViewer -> Config::$rightname used
    $logparser->empty($filepath);
    Html::back();
} elseif (($_POST['action'] ?? '') === 'delete') {
    Session::checkRight(Config::$rightname, UPDATE);
    $logparser->delete($filepath);
    Html::redirect($CFG_GLPI["root_doc"] . "/front/logs.php");
} else {
    Html::header(
        LogViewer::getTypeName(Session::getPluralNumber()),
        '',
        'admin',
        'glpi\system\log\logviewer',
        'logfile'
    );

    $logviewer = new LogViewer();
    $logviewer->showLogFile($filepath);

    Html::footer();
}
