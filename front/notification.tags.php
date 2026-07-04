<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

use Glpi\Exception\Http\BadRequestHttpException;

Html::popHeader(__('List of available tags'));

if (isset($_GET["sub_type"])) {
    Session::checkCentralAccess();
    NotificationTemplateTranslation::showAvailableTags($_GET["sub_type"]);
} else {
    throw new BadRequestHttpException();
}

Html::popFooter();
