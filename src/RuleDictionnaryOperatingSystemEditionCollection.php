<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryOperatingSystemEditionCollection extends RuleDictionnaryDropdownCollection
{
    public $item_table  = "ntas_operatingsystemeditions";
    public $menu_option = "os_edition";

    public function getTitle()
    {
        return __('Dictionary of operating system editions');
    }
}
