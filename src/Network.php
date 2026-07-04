<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class Network
class Network extends CommonDropdown
{
    public static function getTypeName($nb = 0)
    {
        return _n('Network', 'Networks', $nb);
    }

    public static function getIcon()
    {
        return "ti ti-network";
    }
}
