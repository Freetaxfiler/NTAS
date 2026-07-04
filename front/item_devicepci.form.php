<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

/**
 * @since 0.85
 */

$item_device = new Item_DevicePci();
include(GLPI_ROOT . "/front/item_device.common.form.php");
