<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class DatabaseInstanceType extends CommonDropdown
{
    public static function getTypeName($nb = 0)
    {
        return _n('Database instance type', 'Database instance types', $nb);
    }

    public static function getFieldLabel()
    {
        return _n('Type', 'Types', 1);
    }
}
