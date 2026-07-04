<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class Group_KnowbaseItem
/// since version 0.83
class Group_KnowbaseItem extends CommonDBRelation
{
    // From CommonDBRelation
    public static $itemtype_1 = KnowbaseItem::class;
    public static $items_id_1          = 'knowbaseitems_id';
    public static $itemtype_2 = Group::class;
    public static $items_id_2          = 'groups_id';

    public static $checkItem_2_Rights  = self::DONT_CHECK_ITEM_RIGHTS;
    public static $logs_for_item_2     = false;


    /**
     * Get groups for a knowbaseitem
     *
     * @param int $knowbaseitems_id ID of the knowbaseitem
     *
     * @return array of groups linked to a knowbaseitem
     **/
    public static function getGroups($knowbaseitems_id)
    {
        global $DB;

        $groups = [];

        $iterator = $DB->request([
            'FROM'   => self::getTable(),
            'WHERE'  => [
                'knowbaseitems_id' => $knowbaseitems_id,
            ],
        ]);

        foreach ($iterator as $data) {
            $groups[$data['groups_id']][] = $data;
        }
        return $groups;
    }
}
