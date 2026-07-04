<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryNetworkEquipmentModelCollection extends RuleDictionnaryDropdownCollection
{
    public $item_table  = "ntas_networkequipmentmodels";
    public $menu_option = "model.networking";

    public function getTitle()
    {
        return __('Dictionary of networking equipment models');
    }
}
