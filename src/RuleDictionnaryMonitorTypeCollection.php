<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryMonitorTypeCollection extends RuleDictionnaryDropdownCollection
{
    public $item_table  = "ntas_monitortypes";
    public $menu_option = "type.monitor";

    public function getTitle()
    {
        return __('Dictionary of monitor types');
    }
}
