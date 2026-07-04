<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryPrinterTypeCollection extends RuleDictionnaryDropdownCollection
{
    public $item_table  = "ntas_printertypes";
    public $menu_option = "type.printer";

    public function getTitle()
    {
        return __('Dictionary of printer types');
    }
}
