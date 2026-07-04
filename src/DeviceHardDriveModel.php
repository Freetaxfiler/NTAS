<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class DeviceHardDriveModel
class DeviceHardDriveModel extends CommonDeviceModel
{
    public $additional_fields_for_dictionnary = ['manufacturer'];


    public static function getTypeName($nb = 0)
    {
        return _n('Device hard drive model', 'Device hard drive models', $nb);
    }
}
