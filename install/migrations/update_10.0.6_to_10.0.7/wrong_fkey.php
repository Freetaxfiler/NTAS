<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$default_key_sign = DBConnection::getDefaultPrimaryKeySignOption();

$migration->dropKey('ntas_items_devicecameras_imageformats', 'item_devicecameras_id');
$migration->changeField(
    'ntas_items_devicecameras_imageformats',
    'item_devicecameras_id',
    'items_devicecameras_id',
    "int {$default_key_sign} NOT NULL DEFAULT '0'"
);
$migration->addKey('ntas_items_devicecameras_imageformats', 'items_devicecameras_id');

$migration->dropKey('ntas_items_devicecameras_imageresolutions', 'item_devicecameras_id');
$migration->changeField(
    'ntas_items_devicecameras_imageresolutions',
    'item_devicecameras_id',
    'items_devicecameras_id',
    "int {$default_key_sign} NOT NULL DEFAULT '0'"
);
$migration->addKey('ntas_items_devicecameras_imageresolutions', 'items_devicecameras_id');
