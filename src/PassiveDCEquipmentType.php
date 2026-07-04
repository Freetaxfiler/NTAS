<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class PassiveDCEquipmentType
class PassiveDCEquipmentType extends CommonType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Passive device type', 'Passive device types', $nb);
    }
}
