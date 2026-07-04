<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Item_Problem Class
 *
 *  Relation between Problems and Items
 **/
class Item_Problem extends CommonItilObject_Item
{
    // From CommonDBRelation
    public static $itemtype_1 = Problem::class;
    public static $items_id_1          = 'problems_id';

    public static $itemtype_2          = 'itemtype';
    public static $items_id_2          = 'items_id';
    public static $checkItem_2_Rights  = self::HAVE_VIEW_RIGHT_ON_ITEM;

    public static function getTypeName($nb = 0)
    {
        return _n('Problem item', 'Problem items', $nb);
    }
}
