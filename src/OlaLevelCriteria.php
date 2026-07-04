<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @since 9.2
 */


/**
 * Class OlaLevelCriteriaClass OlaLevelCriteria
 */
class OlaLevelCriteria extends RuleCriteria
{
    public static $itemtype = OlaLevel::class;
    public static $items_id  = 'olalevels_id';
    public $dohistory        = true;


    public function __construct($rule_type = 'OlaLevel')
    {
        // Override in order not to use ntas_rules table.
        if ($rule_type !== static::$itemtype) {
            throw new LogicException(
                sprintf(
                    '%s is not expected to be used with a different rule type than %s',
                    static::class,
                    static::$itemtype
                )
            );
        }
    }

    public function rawSearchOptions()
    {
        // RuleCriteria search options requires value of rules_id field which does not exists here
        return [];
    }
}
