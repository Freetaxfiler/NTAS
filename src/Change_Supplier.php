<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Change_Supplier Class
 *
 * Relation between Changes and Suppliers
 *
 * @since 0.84
 **/
class Change_Supplier extends CommonITILActor
{
    // From CommonDBRelation
    public static $itemtype_1 = Change::class;
    public static $items_id_1 = 'changes_id';
    public static $itemtype_2 = Supplier::class;
    public static $items_id_2 = 'suppliers_id';
}
