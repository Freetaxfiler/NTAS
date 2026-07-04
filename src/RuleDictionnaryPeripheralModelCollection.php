<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryPeripheralModelCollection extends RuleDictionnaryDropdownCollection
{
    public $item_table  = "ntas_peripheralmodels";
    public $menu_option = "model.peripheral";

    public function getTitle()
    {
        return __('Dictionary of device models');
    }
}
