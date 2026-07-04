<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleSoftwareCategoryCollection extends RuleCollection
{
    // From RuleCollection
    public $stop_on_first_match = true;
    public static $rightname   = 'rule_softwarecategories';
    public $menu_option = 'softwarecategories';


    public function getTitle()
    {
        return __('Rules for assigning a category to software');
    }

    public function prepareInputDataForProcess($input, $software)
    {
        $params["name"] = $software["name"];
        if (isset($software["comment"])) {
            $params["comment"] = $software["comment"];
        }
        if (isset($software["_system_category"])) {
            $params["_system_category"] = $software["_system_category"];
        }

        if (isset($software["manufacturers_id"])) {
            $params["manufacturer"] = Dropdown::getDropdownName(
                "ntas_manufacturers",
                $software["manufacturers_id"]
            );
        }
        return $params;
    }
}
