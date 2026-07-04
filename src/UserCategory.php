<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class UserCategory
class UserCategory extends CommonDropdown
{
    public static function getTypeName($nb = 0)
    {
        return _n('User category', 'User categories', $nb);
    }

    public static function getIcon()
    {
        return "ti ti-user-cog";
    }
}
