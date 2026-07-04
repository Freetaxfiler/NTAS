<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryPhoneModelCollection extends RuleDictionnaryDropdownCollection
{
    public $item_table  = "ntas_phonemodels";
    public $menu_option = "model.phone";

    public function getTitle()
    {
        return __('Dictionary of phone models');
    }
}
