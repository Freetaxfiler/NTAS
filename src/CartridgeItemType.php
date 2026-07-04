<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Class CartridgeItemType
 **/
class CartridgeItemType extends CommonType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Cartridge type', 'Cartridge types', $nb);
    }
}
