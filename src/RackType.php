<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class RackType
class RackType extends CommonType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Rack type', 'Rack types', $nb);
    }
}
