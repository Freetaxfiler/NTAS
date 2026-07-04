<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Change_Item Class
 *
 * Relation between Changes and Items
 **/
class Change_Item extends CommonItilObject_Item
{
    // From CommonDBRelation
    public static $itemtype_1 = Change::class;
    public static $items_id_1          = 'changes_id';

    public static $itemtype_2          = 'itemtype';
    public static $items_id_2          = 'items_id';
    public static $checkItem_2_Rights  = self::DONT_CHECK_ITEM_RIGHTS;

    public static function getTypeName($nb = 0)
    {
        return _n('Change item', 'Change items', $nb);
    }
}
