<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

use Glpi\Exception\Http\BadRequestHttpException;

Session::checkCentralAccess();

$item_plug = new Item_Plug();

if (isset($_POST['update'], $_POST['itemtype'])) {
    $item_plug->check($_POST['id'], UPDATE);
    $item = getItemForItemtype($_POST['itemtype']);
    // update existing relation
    if ($item_plug->update($_POST)) {
        $url = $item::getFormURLWithID($_POST['items_id']);
    } else {
        $url = $item_plug::getFormURLWithID($_POST['id']);
    }
    Html::redirect($url);
} elseif (isset($_POST['add'], $_POST['itemtype'])) {
    $item_plug->check(-1, CREATE, $_POST);
    $item_plug->add($_POST);
    $item = getItemForItemtype($_POST['itemtype']);
    $url = $item::getFormURLWithID($_POST['items_id']);
    Html::redirect($url);
} elseif (isset($_POST['purge'], $_POST['itemtype'])) {
    $item_plug->check($_POST['id'], PURGE);
    $item_plug->delete($_POST, true);
    $item = getItemForItemtype($_POST['itemtype']);
    $url = $item::getFormURLWithID($_POST['items_id']);
    Html::redirect($url);
}

if (!isset($_GET['itemtype']) && !isset($_GET['items_id']) && !isset($_GET['plugs_id']) && !isset($_GET['number_plug']) && !isset($_GET['id'])) {
    throw new BadRequestHttpException();
}

$params = [];
if (isset($_GET['id'])) {
    $params['id'] = $_GET['id'];
} else {
    $params = [
        'itemtype'     => $_GET['itemtype'],
        'items_id'      => $_GET['items_id'],
        'plugs_id'     => $_GET['plugs_id'],
        'number_plug'  => $_GET['number_plug'],
    ];
}

if (isset($_REQUEST['ajax'])) {
    $item_plug->display($params);
} else {
    $menus = ["assets"];
    Item_Plug::displayFullPageForItem($_GET['id'] ?? 0, $menus, $params);
}
