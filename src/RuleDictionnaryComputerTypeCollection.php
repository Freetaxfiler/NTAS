<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryComputerTypeCollection extends RuleDictionnaryDropdownCollection
{
    public $item_table  = "ntas_computertypes";
    public $menu_option = "type.computer";


    public function getTitle()
    {
        return __('Dictionary of computer types');
    }
}
