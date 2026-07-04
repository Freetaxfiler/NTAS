<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryNetworkEquipmentTypeCollection extends RuleDictionnaryDropdownCollection
{
    public $item_table  = "ntas_networkequipmenttypes";
    public $menu_option = "type.networking";

    public function getTitle()
    {
        return __('Dictionary of network equipment types');
    }
}
