<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

use function Safe\strtotime;

Session::checkRight("planning", READ);

if (empty($_GET["id"])) {
    $_GET["id"] = "";
}

$extevent = new PlanningExternalEvent();

if (isset($_POST["add"])) {
    $extevent->check(-1, CREATE, $_POST);

    if ($newID = $extevent->add($_POST)) {
        if ($_SESSION['glpibackcreated']) {
            Html::redirect($extevent->getLinkURL());
        }
    }
    Html::back();
} elseif (isset($_POST["delete"])) {
    $extevent->check($_POST["id"], DELETE);
    $extevent->delete($_POST);
    $extevent->redirectToList();
} elseif (isset($_POST["restore"])) {
    $extevent->check($_POST["id"], DELETE);
    $extevent->restore($_POST);
    $extevent->redirectToList();
} elseif (isset($_POST["purge"])) {
    $extevent->check($_POST["id"], PURGE);
    $extevent->delete($_POST, true);
    $extevent->redirectToList();
} elseif (isset($_POST["purge_instance"])) {
    $extevent->check($_POST["id"], PURGE);
    $extevent->deleteInstance((int) $_POST["id"], $_POST['day']);
    $extevent->redirectToList();
} elseif (isset($_POST["save_instance"])) {
    $input = $_POST;
    unset($input['id']);
    unset($input['rrule']);
    $input['plan']['begin'] = $_POST['day'] . date(" H:i:s", strtotime($_POST['plan']['begin']));
    $extevent->check(-1, CREATE, $input);
    $extevent->add($input);
    $extevent->deleteInstance((int) $_POST["id"], $_POST['day']);
    $extevent->redirectToList();
} elseif (isset($_POST["update"])) {
    $extevent->check($_POST["id"], UPDATE);
    $extevent->update($_POST);
    Html::back();
} else {
    $menus = ["helpdesk", "planning", "PlanningExternalEvent"];
    PlanningExternalEvent::displayFullPageForItem($_GET["id"], $menus);
}
