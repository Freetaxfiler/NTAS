<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

/**
 * @since 0.85
 */

$translation = new DropdownTranslation();
if (isset($_POST['add'])) {
    $translation->add($_POST);
} elseif (isset($_POST['update'])) {
    $translation->update($_POST);
} elseif (isset($_POST['purge'])) {
    $translation->delete($_POST, true);
}
Html::back();
