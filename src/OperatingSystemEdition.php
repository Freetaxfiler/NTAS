<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class OperatingSystemEdition extends CommonDropdown
{
    public $can_be_translated = true;

    public static function getTypeName($nb = 0)
    {
        return _n('Edition', 'Editions', $nb);
    }
}
