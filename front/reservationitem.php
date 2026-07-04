<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

Session::checkRightsOr('reservation', [READ, ReservationItem::RESERVEANITEM]);

if (Session::getCurrentInterface() == "helpdesk") {
    Html::helpHeader(__('Simplified interface'), 'reservation');
} else {
    Html::header(Reservation::getTypeName(Session::getPluralNumber()), '', "tools", "reservationitem");
}

$res = new ReservationItem();
$res->display($_GET);

if (isset($_POST['submit'])) {
    $_SESSION['ntas_saved']['ReservationItem'] = $_POST;
} else {
    unset($_SESSION['ntas_saved']['ReservationItem']);
}

if (Session::getCurrentInterface() == "helpdesk") {
    Html::helpFooter();
} else {
    Html::footer();
}
