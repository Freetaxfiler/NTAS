<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Relation between item and devices
 **/
class Item_DeviceFirmware extends Item_Devices
{
    public static $itemtype_2 = DeviceFirmware::class;
    public static $items_id_2 = 'devicefirmwares_id';

    protected static $notable = false;

    public static function getSpecificities($specif = '')
    {
        return [
            'serial' => parent::getSpecificities('serial'),
            'otherserial' => parent::getSpecificities('otherserial'),
            'locations_id' => parent::getSpecificities('locations_id'),
            'states_id' => parent::getSpecificities('states_id'),
        ];
    }

    public function getImportCriteria(): array
    {
        return [
            'serial' => 'equal',
        ];
    }
}
