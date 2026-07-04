<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryPhoneTypeCollection extends RuleDictionnaryDropdownCollection
{
    public $item_table  = "ntas_phonetypes";
    public $menu_option = "type.phone";

    public function getTitle()
    {
        return __('Dictionary of phone types');
    }
}
