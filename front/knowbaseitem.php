<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

use Glpi\Exception\Http\AccessDeniedHttpException;

global $CFG_GLPI;

if (!Session::haveRightsOr('knowbase', [READ, KnowbaseItem::READFAQ])) {
    throw new AccessDeniedHttpException();
}
if (isset($_GET["id"])) {
    Html::redirect(KnowbaseItem::getFormURLWithID($_GET["id"]));
}

Html::header(KnowbaseItem::getTypeName(1), '', "tools", "knowbaseitem");

// Search a solution
if (
    !isset($_GET["contains"])
    && isset($_GET["item_itemtype"])
    && isset($_GET["item_items_id"])
) {
    if (in_array($_GET["item_itemtype"], $CFG_GLPI['kb_types']) && $item = getItemForItemtype($_GET["item_itemtype"])) {
        if ($item->can($_GET["item_items_id"], READ)) {
            $_GET["contains"] = $item->getField('name');
        }
    }
}

// Manage forcetab : non standard system (file name <> class name)
if (isset($_GET['forcetab'])) {
    Session::setActiveTab('Knowbase', $_GET['forcetab']);
    unset($_GET['forcetab']);
}

$kb = new Knowbase();
$kb->display($_GET);

Html::footer();
