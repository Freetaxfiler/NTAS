<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class Problem_User
class Problem_User extends CommonITILActor
{
    // From CommonDBRelation
    public static $itemtype_1 = Problem::class;
    public static $items_id_1 = 'problems_id';
    public static $itemtype_2 = User::class;
    public static $items_id_2 = 'users_id';
}
