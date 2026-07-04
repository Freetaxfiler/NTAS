<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class DeviceCaseType (Interface is a reserved keyword)
class DeviceCaseType extends CommonDeviceType
{
    public static function getTypeName($nb = 0)
    {
        return  _n('Case type', 'Case types', $nb);
    }
}
