<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

use Glpi\Event;
use Glpi\Exception\Http\BadRequestHttpException;

$category = new KnowbaseItem_KnowbaseItemCategory();

if (isset($_POST["add"])) {
    if (!isset($_POST['knowbaseitems_id']) || !isset($_POST['knowbaseitemcategories_id'])) {
        Session::addMessageAfterRedirect(__s('Mandatory fields are not filled!'), false, ERROR);
        Html::back();
    }

    if ($category->add($_POST)) {
        Event::log(
            $_POST["knowbaseitems_id"],
            "knowbaseitem",
            4,
            "tracking",
            sprintf(__('%s adds a link with a category'), $_SESSION["glpiname"])
        );
    }
    Html::back();
}

throw new BadRequestHttpException();
