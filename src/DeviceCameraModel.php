<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class DeviceCameraModel extends CommonDeviceModel
{
    public $additional_fields_for_dictionnary = ['manufacturer'];

    public static function getTypeName($nb = 0)
    {
        return _n('Device camera model', 'Device camera models', $nb);
    }
}
