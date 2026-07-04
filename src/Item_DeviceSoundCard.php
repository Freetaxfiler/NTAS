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
class Item_DeviceSoundCard extends Item_Devices
{
    public static $itemtype_2 = DeviceSoundCard::class;
    public static $items_id_2 = 'devicesoundcards_id';

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

    public function getImportCriteria(): array
    {
        return [
            'serial' => 'serial',
            'busID' => 'busID',
        ];
    }
}
