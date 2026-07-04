<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleProblemCollection extends RuleCommonITILObjectCollection
{
    // From RuleCollection
    public static $rightname                        = 'rule_problem';
    public $menu_option                             = 'problem';

    public function getTitle()
    {
        return __('Business rules for problems');
    }
}
