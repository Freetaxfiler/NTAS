<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryManufacturerCollection extends RuleDictionnaryDropdownCollection
{
    // From RuleCollection
    //public $rule_class_name = 'RuleDictionnaryManufacturer';

    public $item_table  = "ntas_manufacturers";
    public $menu_option = "manufacturers";

    public function getTitle()
    {
        return __('Dictionary of manufacturers');
    }
}
