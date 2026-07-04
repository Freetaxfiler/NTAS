<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Relation between item and devices
 **/
class Item_DeviceGraphicCard extends Item_Devices
{
    public static $itemtype_2 = DeviceGraphicCard::class;
    public static $items_id_2 = 'devicegraphiccards_id';

    protected static $notable = false;


    public static function getSpecificities($specif = '')
    {

        return [
            'memory' => [
                'long name'  => sprintf(__('%1$s (%2$s)'), _n('Memory', 'Memories', 1), __('Mio')),
                'short name' => _n('Memory', 'Memories', 1),
                'size'       => 10,
                'id'         => 20,
                'datatype'   => 'integer',
            ],
            'serial' => parent::getSpecificities('serial'),
            'otherserial' => parent::getSpecificities('otherserial'),
            'locations_id' => parent::getSpecificities('locations_id'),
            'states_id' => parent::getSpecificities('states_id'),
            'busID'  => parent::getSpecificities('busID'),
        ];
    }

    public function getImportCriteria(): array
    {
        return [
            'serial' => 'equal',
            'busID' => 'equal',
        ];
    }
}
