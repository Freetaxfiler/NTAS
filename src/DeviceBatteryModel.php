<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class DeviceBatteryModel
class DeviceBatteryModel extends CommonDeviceModel
{
    public $additional_fields_for_dictionnary = ['manufacturer'];

    public static function getTypeName($nb = 0)
    {
        return _n('Device battery model', 'Device batteries models', $nb);
    }
}
