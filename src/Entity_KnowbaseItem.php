<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class Entity_KnowbaseItem
/// since version 0.83
class Entity_KnowbaseItem extends CommonDBRelation
{
    // From CommonDBRelation
    public static $itemtype_1 = KnowbaseItem::class;
    public static $items_id_1          = 'knowbaseitems_id';
    public static $itemtype_2 = Entity::class;
    public static $items_id_2          = 'entities_id';

    public static $checkItem_2_Rights  = self::DONT_CHECK_ITEM_RIGHTS;
    public static $logs_for_item_2     = false;


    /**
     * Get entities for a knowbaseitem
     *
     * @param int $knowbaseitems_id ID of the knowbaseitem
     *
     * @return array of entities linked to a knowbaseitem
     **/
    public static function getEntities($knowbaseitems_id)
    {
        global $DB;

        $ent   = [];

        $iterator = $DB->request([
            'FROM'   => self::getTable(),
            'WHERE'  => [
                'knowbaseitems_id' => $knowbaseitems_id,
            ],
        ]);

        foreach ($iterator as $data) {
            $ent[$data['entities_id']][] = $data;
        }
        return $ent;
    }
}
