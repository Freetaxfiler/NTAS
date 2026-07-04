<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class DeviceMemoryType
class DeviceMemoryType extends CommonDeviceType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Memory type', 'Memory types', $nb);
    }
}
