<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class PhonePowerSupply
class PhonePowerSupply extends CommonDropdown
{
    public $can_be_translated = false;


    public static function getTypeName($nb = 0)
    {
        return _n('Phone power supply type', 'Phone power supply types', $nb);
    }
}
