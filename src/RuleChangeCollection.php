<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleChangeCollection extends RuleCommonITILObjectCollection
{
    // From RuleCollection
    public static $rightname                        = 'rule_change';
    public $menu_option                             = 'change';

    public function getTitle()
    {
        return __('Business rules for changes');
    }
}
