<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class DeviceGenericType
class DeviceGenericType extends CommonDeviceType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Generic type', 'Generic types', $nb);
    }
}
