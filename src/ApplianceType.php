<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class ApplianceType extends CommonDropdown
{
    public static function getTypeName($nb = 0)
    {
        return _n('Appliance type', 'Appliance types', $nb);
    }

    public static function getIcon()
    {
        return Appliance::getIcon();
    }
}
