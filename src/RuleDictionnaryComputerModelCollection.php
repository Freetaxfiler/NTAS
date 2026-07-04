<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryComputerModelCollection extends RuleDictionnaryDropdownCollection
{
    public $item_table  = "ntas_computermodels";
    public $menu_option = "model.computer";

    public function getTitle()
    {
        return __('Dictionary of computer models');
    }
}
