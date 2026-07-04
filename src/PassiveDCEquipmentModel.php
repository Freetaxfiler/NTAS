<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class PassiveDCEquipmentModel
class PassiveDCEquipmentModel extends CommonDCModelDropdown
{
    public static function getTypeName($nb = 0)
    {
        return _n('Passive device model', 'Passive device models', $nb);
    }
}
