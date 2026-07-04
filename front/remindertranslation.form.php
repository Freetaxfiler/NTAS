<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

/**
 * @since 9.5
 */

$translation = new ReminderTranslation();

if (isset($_POST['add'])) {
    $translation->add($_POST);
    Html::back();
} elseif (isset($_POST['update'])) {
    $translation->update($_POST);
    Html::back();
} elseif (isset($_POST["purge"])) {
    $translation->delete($_POST, true);
    Html::redirect(Reminder::getFormURLWithID($_POST['reminders_id']));
} elseif (isset($_GET["id"])) {
    $menus = ["tools", "remindertranslation"];
    ReminderTranslation::displayFullPageForItem($_GET['id'], $menus);
}
