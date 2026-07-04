<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

global $CFG_GLPI;

if (!isset($_GET["id"])) {
    $_GET["id"] = "";
}
$client = new OAuthClient();

if (isset($_POST["add"])) {
    $client->check(-1, CREATE, $_POST);
    $client->add($_POST);
    Html::back();
} elseif (isset($_POST["update"])) {
    $client->check($_POST["id"], UPDATE);
    $client->update($_POST);
    Html::back();
} elseif (isset($_POST["purge"])) {
    $client->check($_POST["id"], PURGE);
    $client->delete($_POST);
    Html::redirect($CFG_GLPI["root_doc"] . "/front/oauthclient.php");
} else {
    $menus = ["config", "oauthclient"];
    OAuthClient::displayFullPageForItem($_GET["id"], $menus);
}
