<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class MonitorType
class MonitorType extends CommonType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Monitor type', 'Monitor types', $nb);
    }
}
