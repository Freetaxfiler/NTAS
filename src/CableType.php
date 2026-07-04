<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Class CableType
 */
class CableType extends CommonDropdown
{
    public static function getTypeName($nb = 0)
    {
        return _n('Cable type', 'Cable types', $nb);
    }

    public static function getFieldLabel()
    {
        return self::getTypeName(1);
    }

    public static function getIcon()
    {
        return Cable::getIcon();
    }
}
