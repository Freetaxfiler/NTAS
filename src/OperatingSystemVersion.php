<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class OperatingSystemVersion
class OperatingSystemVersion extends CommonDropdown
{
    public $can_be_translated = false;


    public static function getTypeName($nb = 0)
    {
        return _n('Version of the operating system', 'Versions of the operating systems', $nb);
    }
}
