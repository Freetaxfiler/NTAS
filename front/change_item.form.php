<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

$obj      = new Change();
$item_obj = new Change_Item();
include(GLPI_ROOT . '/front/commonitilobject_item.form.php');
