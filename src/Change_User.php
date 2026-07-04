<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Change_User Class
 *
 * Relation between Changes and Users
 **/
class Change_User extends CommonITILActor
{
    // From CommonDBRelation
    public static $itemtype_1 = Change::class;
    public static $items_id_1 = 'changes_id';
    public static $itemtype_2 = User::class;
    public static $items_id_2 = 'users_id';
}
