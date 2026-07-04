<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

use Glpi\Exception\Http\AccessDeniedHttpException;
use Glpi\Marketplace\Controller as MarketplaceController;

Session::checkRight("config", UPDATE);

if (!MarketplaceController::isWebAllowed()) {
    throw new AccessDeniedHttpException();
}
if (isset($_REQUEST['key'])) {
    $marketplace_ctrl = new MarketplaceController($_REQUEST['key']);
    return $marketplace_ctrl->proxifyPluginArchive();
}
