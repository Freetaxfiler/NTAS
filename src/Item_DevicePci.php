<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @since 0.84
 */


/**
 * Relation between item and devices
 **/
class Item_DevicePci extends Item_Devices
{
    public static $itemtype_2 = DevicePci::class;
    public static $items_id_2 = 'devicepcis_id';

    protected static $notable = false;


    public static function getSpecificities($specif = '')
    {

        return ['serial' => parent::getSpecificities('serial'),
            'otherserial' => parent::getSpecificities('otherserial'),
            'locations_id' => parent::getSpecificities('locations_id'),
            'states_id' => parent::getSpecificities('states_id'),
            'busID'  => parent::getSpecificities('busID'),
        ];
    }
}
