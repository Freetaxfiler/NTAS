<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

global $CFG_GLPI;

// Redirect management
if (isset($_GET["redirect"])) {
    Toolbox::manageRedirect($_GET["redirect"]);
}

if (Session::getLoginUserID()) {
    Html::helpHeader(__('FAQ'), 'faq');
} else {
    $_SESSION["glpilanguage"] = $_SESSION['glpilanguage'] ?? Session::getPreferredLanguage();
    // Anonymous FAQ
    Html::simpleHeader(__('FAQ'), [
        __('Authentication') => '/',
        __('FAQ')            => '/front/helpdesk.faq.php',
    ]);
}

if (isset($_GET["id"])) {
    $kb = new KnowbaseItem();
    if ($kb->getFromDB($_GET["id"])) {
        $kb->showFull();
    }
} else {
    // Manage forcetab : non standard system (file name <> class name)
    if (isset($_GET['forcetab'])) {
        Session::setActiveTab('Knowbase', $_GET['forcetab']);
        unset($_GET['forcetab']);
    }

    $kb = new Knowbase();
    $kb->display($_GET);
}

Html::helpFooter();
