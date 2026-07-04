<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Import rules collection class
class RuleImportEntityCollection extends RuleCollection
{
    // From RuleCollection
    public $stop_on_first_match = true;
    public static $rightname           = 'rule_import';
    public $menu_option         = 'importentity';


    public function canList()
    {
        return static::canView();
    }

    public function getTitle()
    {
        return __('Rules for assigning an item to an entity');
    }
}
