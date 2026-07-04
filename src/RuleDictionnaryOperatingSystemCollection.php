<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryOperatingSystemCollection extends RuleDictionnaryDropdownCollection
{
    public $item_table  = "ntas_operatingsystems";
    public $menu_option = "os";

    public function getTitle()
    {
        return __('Dictionary of operating systems');
    }
}
