<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

Session::checkRight("device", READ);

Html::header(_n('Component', 'Components', Session::getPluralNumber()), '', "config", "commondevice");
echo "<div class='text-center'>";

$optgroup = Dropdown::getDeviceItemTypes(true);
Dropdown::showItemTypeList($optgroup);

echo "</div>";
Html::footer();
