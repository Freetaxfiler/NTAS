<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * ProblemCost Class
 *
 * @since 0.85
 **/
class ProblemCost extends CommonITILCost
{
    // From CommonDBChild
    public static $itemtype = Problem::class;
    public static $items_id  = 'problems_id';


    public static function canCreate(): bool
    {
        return Session::haveRight('problem', UPDATE);
    }


    public static function canView(): bool
    {
        return Session::haveRightsOr('problem', [Problem::READALL, Problem::READMY]);
    }


    public static function canUpdate(): bool
    {
        return Session::haveRight('problem', UPDATE);
    }
}
