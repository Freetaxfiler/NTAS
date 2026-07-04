<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class PeripheralType
class PeripheralType extends CommonType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Devices type', 'Devices types', $nb);
    }
}
