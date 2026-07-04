<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryPeripheralTypeCollection extends RuleDictionnaryDropdownCollection
{
    public $item_table  = "ntas_peripheraltypes";
    public $menu_option = "type.peripheral";

    public function getTitle()
    {
        return __('Dictionary of device types');
    }
}
