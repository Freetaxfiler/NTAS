<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @since 9.2
 */


class DeviceSimcardType extends CommonDeviceType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Simcard type', 'Simcard types', $nb);
    }
}
