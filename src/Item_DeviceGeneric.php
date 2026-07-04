<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class Item_DeviceGeneric extends Item_Devices
{
    public static $itemtype_2 = DeviceGeneric::class;
    public static $items_id_2 = 'devicegenerics_id';

    protected static $notable = false;


    public static function getSpecificities($specif = '')
    {
        return ['serial' => parent::getSpecificities('serial'),
            'otherserial' => parent::getSpecificities('otherserial'),
            'locations_id' => parent::getSpecificities('locations_id'),
            'states_id' => parent::getSpecificities('states_id'),
        ];
    }
}
