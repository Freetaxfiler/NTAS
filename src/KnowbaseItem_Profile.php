<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class KnowbaseItem_Profile
/// since version 0.83
class KnowbaseItem_Profile extends CommonDBRelation
{
    // From CommonDBRelation
    public static $itemtype_1 = KnowbaseItem::class;
    public static $items_id_1          = 'knowbaseitems_id';
    public static $itemtype_2 = Profile::class;
    public static $items_id_2          = 'profiles_id';

    public static $checkItem_2_Rights  = self::DONT_CHECK_ITEM_RIGHTS;
    public static $logs_for_item_2     = false;


    /**
     * Get profiles for a knowbaseitem
     *
     * @param int $knowbaseitems_id  ID of the knowbaseitem
     *
     * @return array of profiles linked to a knowbaseitem
     **/
    public static function getProfiles($knowbaseitems_id)
    {
        global $DB;

        $prof  = [];

        $iterator = $DB->request([
            'FROM'   => self::getTable(),
            'WHERE'  => [
                'knowbaseitems_id' => $knowbaseitems_id,
            ],
        ]);

        foreach ($iterator as $data) {
            $prof[$data['profiles_id']][] = $data;
        }
        return $prof;
    }
}
