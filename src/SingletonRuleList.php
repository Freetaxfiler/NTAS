<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class SingletonRuleList
{
    /** @var Rule[] */
    public $list = [];
    /**
     * Items loaded?
     * @var int
     */
    public $load = 0;


    /**
     * get a unique instance of a SingletonRuleList for a type of RuleCollection
     *
     * @param string $type   type of the Rule listed
     * @param int    $entity entity ID where the rule Rule is processed
     *
     * @return SingletonRuleList unique instance of an object
     **/
    public static function &getInstance($type, $entity)
    {
        //FIXME: can be removed when using phpunit 10 and process-isolation
        if (defined('TU_USER')) {
            $o = new self();
            return $o;
        }

        static $instances = [];

        if (!isset($instances[$type][$entity])) {
            $instances[$type][$entity] = new self();
        }
        return $instances[$type][$entity];
    }
}
