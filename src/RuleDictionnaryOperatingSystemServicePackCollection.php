<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryOperatingSystemServicePackCollection extends RuleDictionnaryDropdownCollection
{
    public $item_table  = "ntas_operatingsystemservicepacks";
    public $menu_option = "os_sp";

    public function getTitle()
    {
        return __('Dictionary of service packs');
    }
}
