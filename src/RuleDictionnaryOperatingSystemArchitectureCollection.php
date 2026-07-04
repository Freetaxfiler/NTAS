<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryOperatingSystemArchitectureCollection extends RuleDictionnaryDropdownCollection
{
    public $item_table  = "ntas_operatingsystemarchitectures";
    public $menu_option = "os_arch";

    public function getTitle()
    {
        return __('Dictionary of operating system architectures');
    }
}
