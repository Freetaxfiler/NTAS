<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Class Problem_Supplier
 *
 * @since 0.84
 *
 **/
class Problem_Supplier extends CommonITILActor
{
    // From CommonDBRelation
    public static $itemtype_1 = Problem::class;
    public static $items_id_1 = 'problems_id';
    public static $itemtype_2 = Supplier::class;
    public static $items_id_2 = 'suppliers_id';
}
