<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

use Glpi\Exception\Http\BadRequestHttpException;

/**
 * Form to edit Cron Task
 */

Session::checkRight("config", READ);

$crontask = new CronTask();

if (isset($_POST['execute'])) {
    Session::checkRight("config", UPDATE);
    if (is_numeric($_POST['execute'])) {
        // Execute button from list.
        $name = CronTask::launch(CronTask::MODE_INTERNAL, intval($_POST['execute']));
    } else {
        // Execute button from Task form (force)
        $name = CronTask::launch(-CronTask::MODE_INTERNAL, 1, $_POST['execute']);
    }
    if ($name) {
        //TRANS: %s is a task name
        Session::addMessageAfterRedirect(htmlescape(sprintf(__('Task %s executed'), $name)));
    }
    Html::back();
} elseif (isset($_POST["update"])) {
    Session::checkRight('config', UPDATE);
    $crontask->update($_POST);
    Html::back();
} elseif (
    isset($_POST['resetdate'])
           && isset($_POST["id"])
) {
    Session::checkRight('config', UPDATE);
    if ($crontask->getFromDB($_POST["id"])) {
        $crontask->resetDate();
    }
    Html::back();
} elseif (
    isset($_POST['resetstate'])
           && isset($_POST["id"])
) {
    Session::checkRight('config', UPDATE);
    if ($crontask->getFromDB($_POST["id"])) {
        $crontask->resetState();
    }
    Html::back();
} else {
    if (!isset($_GET["id"]) || empty($_GET["id"])) {
        throw new BadRequestHttpException();
    }
    $menus = ['config', 'crontask'];
    CronTask::displayFullPageForItem($_GET['id'], $menus);
}
