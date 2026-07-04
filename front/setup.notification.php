<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

global $CFG_GLPI;

Session::checkSeveralRightsOr(['notification' => READ,
    'config'       => UPDATE,
]);

Html::header(_n('Notification', 'Notifications', Session::getPluralNumber()), '', "config", "notification");

if (
    !Session::haveRight("config", READ)
    && Session::haveRight("notification", READ)
) {
    Html::redirect($CFG_GLPI["root_doc"] . '/front/notification.php');
}

$settingconfig = new NotificationSettingConfig();

// Init $CFG_GLPI['notifications_modes']
Notification_NotificationTemplate::getModes();

if (count($_POST)) {
    $settingconfig->update($_POST);
    Html::back();
}

$settingconfig->showConfigForm();

Html::footer();
