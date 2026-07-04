<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryMonitorModelCollection extends RuleDictionnaryDropdownCollection
{
    public $item_table  = "ntas_monitormodels";
    public $menu_option = "model.monitor";


    public function getTitle()
    {
        return __('Dictionary of computer models');
    }
}
