<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

use Glpi\Event;
use Glpi\Exception\Http\BadRequestHttpException;

/**
 * @var CommonDBTM $obj
 * @var CommonItilObject_Item $item_obj
 */

if (!($obj instanceof CommonDBTM) || !($item_obj instanceof CommonItilObject_Item)) {
    throw new BadRequestHttpException('Bad request');
}

$obj_fkey = $obj->getForeignKeyField();

if (isset($_POST["add"])) {
    if (isset($_POST['my_items']) && !empty($_POST['my_items'])) {
        [$_POST['itemtype'], $_POST['items_id']] = explode('_', $_POST['my_items']);
    }

    if (isset($_POST['add_items_id'])) {
        $_POST['items_id'] = $_POST['add_items_id'];
    }

    if (!isset($_POST['items_id']) || empty($_POST['items_id'])) {
        $message = sprintf(
            __('Mandatory fields are not filled. Please correct: %s'),
            _n('Associated element', 'Associated elements', 1)
        );
        Session::addMessageAfterRedirect(htmlescape($message), false, ERROR);
        Html::back();
    }

    $item_obj->check(-1, CREATE, $_POST);

    if ($item_obj->add($_POST)) {
        Event::log(
            $_POST[$obj_fkey],
            strtolower($obj->getType()),
            4,
            "tracking",
            //TRANS: %s is the user login
            sprintf(__('%s adds a link with an item'), $_SESSION["glpiname"])
        );
    }
    Html::back();
} elseif (isset($_POST["delete"])) {
    $item_obj->deleteByCriteria([
        $obj_fkey  => $_POST[$obj_fkey],
        'items_id' => $_POST['items_id'],
        'itemtype' => $_POST['itemtype'],
    ]);
    Html::back();
}

throw new BadRequestHttpException();
