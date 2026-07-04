<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * ChangeValidation class
 */
class ChangeValidation extends CommonITILValidation
{
    // From CommonDBChild
    public static $itemtype = Change::class;
    public static $items_id           = 'changes_id';

    public static $rightname                 = 'changevalidation';


    public static function getTypeName($nb = 0)
    {
        return _n('Change approval', 'Change approvals', $nb);
    }
}
