<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class NetworkInterface
class NetworkInterface extends CommonDropdown
{
    public $can_be_translated = false;


    public static function getTypeName($nb = 0)
    {
        return _n('Network interface', 'Network interfaces', $nb);
    }

    public static function getIcon()
    {
        return "fas fa-ethernet";
    }
}
