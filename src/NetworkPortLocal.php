<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Local instantiation of NetworkPort. Among others, loopback (ie.: 127.0.0.1).
 * @since 0.84
 */
class NetworkPortLocal extends NetworkPortInstantiation
{
    public $canHaveVLAN = false;
    public $haveMAC     = false;

    public static function getTypeName($nb = 0)
    {
        return __('Local loop port');
    }
}
