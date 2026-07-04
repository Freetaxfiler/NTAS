<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class ApplianceEnvironment extends CommonDropdown
{
    public static function getTypeName($nb = 0)
    {
        return _n('Appliance environment', 'Appliance environments', $nb);
    }

    public static function getIcon()
    {
        return Appliance::getIcon();
    }
}
