<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * ChangeCost Class
 *
 * @since 0.85
 **/
class ChangeCost extends CommonITILCost
{
    // From CommonDBChild
    public static $itemtype = Change::class;
    public static $items_id  = 'changes_id';


    public static function canCreate(): bool
    {
        return Session::haveRight('change', UPDATE);
    }


    public static function canView(): bool
    {
        return Session::haveRightsOr('change', [Change::READALL, Change::READMY]);
    }


    public static function canUpdate(): bool
    {
        return Session::haveRight('change', UPDATE);
    }
}
