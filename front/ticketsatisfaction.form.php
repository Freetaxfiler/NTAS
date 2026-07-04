<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

use Glpi\Event;
use Glpi\Exception\Http\BadRequestHttpException;

$inquest = new TicketSatisfaction();

if (isset($_POST["update"])) {
    $inquest->check($_POST["tickets_id"], UPDATE);
    $inquest->update($_POST);

    Event::log(
        $inquest->getField('tickets_id'),
        "ticket",
        4,
        "tracking",
        //TRANS: %s is the user login
        sprintf(__('%s updates an item'), $_SESSION["glpiname"])
    );
    Html::back();
}

throw new BadRequestHttpException();
