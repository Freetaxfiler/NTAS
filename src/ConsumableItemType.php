<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class ConsumableItemType
class ConsumableItemType extends CommonType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Consumable type', 'Consumable types', $nb);
    }
}
