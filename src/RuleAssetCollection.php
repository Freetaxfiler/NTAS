<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleAssetCollection extends RuleCollection
{
    // From RuleCollection
    public $stop_on_first_match = false;
    public static $rightname           = 'rule_asset';
    public $menu_option         = 'ruleasset';

    public function getTitle()
    {
        return __('Business rules for assets');
    }

    public function cleanTestOutputCriterias(array $output)
    {
        if (isset($output["_rule_process"])) {
            unset($output["_rule_process"]);
        }
        return $output;
    }
}
