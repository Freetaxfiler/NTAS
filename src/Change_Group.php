<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Change_Group Class
 *
 * @since 0.85
 *
 *  Relation between Changes and Groups
 **/
class Change_Group extends CommonITILActor
{
    // From CommonDBRelation
    public static $itemtype_1 = Change::class;
    public static $items_id_1 = 'changes_id';
    public static $itemtype_2 = Group::class;
    public static $items_id_2 = 'groups_id';
}
