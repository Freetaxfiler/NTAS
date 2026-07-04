<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class DeviceMemoryModel
class DeviceMemoryModel extends CommonDeviceModel
{
    public $additional_fields_for_dictionnary = ['manufacturer'];


    public static function getTypeName($nb = 0)
    {
        return _n('Device memory model', 'Device memory models', $nb);
    }
}
