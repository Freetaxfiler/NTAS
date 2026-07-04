<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class DeviceHardDriveType extends CommonDeviceType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Device hard drive type', 'Device hard drive types', $nb);
    }
}
