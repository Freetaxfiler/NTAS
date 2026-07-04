<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class NetworkEquipementType
class NetworkEquipmentType extends CommonDropdown
{
    public static function getTypeName($nb = 0)
    {
        return _n('Networking equipment type', 'Networking equipment types', $nb);
    }

    public static function getFieldLabel()
    {
        return _n('Type', 'Types', 1);
    }
}
