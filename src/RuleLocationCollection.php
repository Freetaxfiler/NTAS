<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleLocationCollection extends RuleCollection
{
    public $stop_on_first_match = true;
    public static $rightname    = 'rule_location';
    public $menu_option         = 'location';

    public function getTitle()
    {
        return __("Location rules");
    }
}
