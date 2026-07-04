<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class DeviceBatteryType extends CommonDeviceType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Battery type', 'Battery types', $nb);
    }
}
