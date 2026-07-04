<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class MonitorModel
class MonitorModel extends CommonDCModelDropdown
{
    public static function getTypeName($nb = 0)
    {
        return _n('Monitor model', 'Monitor models', $nb);
    }
}
