<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$mapping = [
    'Computer_SoftwareLicense' => 'Item_SoftwareLicense',
    'Computer_SoftwareVersion' => 'Item_SoftwareVersion',
];
foreach ($mapping as $old_itemtype => $new_itemtype) {
    $migration->renameItemtype($old_itemtype, $new_itemtype, false);
}
