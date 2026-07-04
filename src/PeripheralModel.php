<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class PeripheralModel
class PeripheralModel extends CommonDCModelDropdown
{
    public static function getTypeName($nb = 0)
    {
        return _n('Peripheral model', 'Peripheral models', $nb);
    }
}
