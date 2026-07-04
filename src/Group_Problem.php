<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class Group_Problem
class Group_Problem extends CommonITILActor
{
    // From CommonDBRelation
    public static $itemtype_1 = Problem::class;
    public static $items_id_1 = 'problems_id';
    public static $itemtype_2 = Group::class;
    public static $items_id_2 = 'groups_id';
}
