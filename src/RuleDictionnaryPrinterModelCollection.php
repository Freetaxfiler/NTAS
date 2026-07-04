<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryPrinterModelCollection extends RuleDictionnaryDropdownCollection
{
    public $item_table  = "ntas_printermodels";
    public $menu_option = "model.printer";

    public function getTitle()
    {
        return __('Dictionary of printer models');
    }
}
