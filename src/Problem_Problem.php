<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @since 11.0.0
 *
 * Problem_Problem Class
 *
 * Relation between Problems and other Problems
 **/
class Problem_Problem extends CommonITILObject_CommonITILObject
{
    // From CommonDBRelation
    public static $itemtype_1 = Problem::class;
    public static $items_id_1   = 'problems_id_1';

    public static $itemtype_2 = Problem::class;
    public static $items_id_2   = 'problems_id_2';

    public static function getTypeName($nb = 0)
    {
        return _n('Link Problem/Problem', 'Links Problem/Problem', $nb);
    }
}
