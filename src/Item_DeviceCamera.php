<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Relation between item and devices
 **/
class Item_DeviceCamera extends Item_Devices
{
    public static $itemtype_2 = DeviceCamera::class;
    public static $items_id_2 = 'devicecameras_id';

    protected static $notable = false;

    public static function getSpecificities($specif = '')
    {
        return [];
    }

    public function getImportCriteria(): array
    {
        return [];
    }

    public function cleanDBonPurge()
    {
        $this->deleteChildrenAndRelationsFromDb([
            Item_DeviceCamera_ImageFormat::class,
            Item_DeviceCamera_ImageResolution::class,
        ]);
    }
}
