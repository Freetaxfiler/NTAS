<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryOperatingSystemVersionCollection extends RuleDictionnaryDropdownCollection
{
    public $item_table  = "ntas_operatingsystemversions";
    public $menu_option = "os_version";

    public function getTitle()
    {
        return __('Dictionary of operating system versions');
    }
}
