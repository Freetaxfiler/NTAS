<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

Session::checkRightsOr('search_config', [DisplayPreference::PERSONAL,
    DisplayPreference::GENERAL,
]);

$setupdisplay = new DisplayPreference();

Html::popHeader(__('Setup'), in_modal: true);
// Datas may come from GET or POST : use REQUEST
if (isset($_REQUEST["itemtype"])) {
    $setupdisplay->display([
        'displaytype' => $_REQUEST['itemtype'],
        'no_switch'   => $_REQUEST['no_switch'] ?? false,
        'forced_tab'  => $_REQUEST['forcetab'] ?? null,
        'in_modal'    => true,
    ]);
}

Html::popFooter();
