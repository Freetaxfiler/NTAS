<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class DeviceFirmwareType extends CommonDeviceType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Firmware type', 'Firmware types', $nb);
    }
}
