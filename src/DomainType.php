<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class DomainType extends CommonDropdown
{
    public static $rightname = 'dropdown';

    public static function getTypeName($nb = 0)
    {
        return _n('Domain type', 'Domain types', $nb);
    }
}
