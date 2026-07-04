<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

$rulecollection = new RuleDictionnaryPeripheralTypeCollection();

include(GLPI_ROOT . "/front/rule.common.form.php");
