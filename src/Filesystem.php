<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class Filesystem
class Filesystem extends CommonDropdown
{
    public $can_be_translated = false;


    public static function getTypeName($nb = 0)
    {
        return _n('File system', 'File systems', $nb);
    }

    public static function getIcon()
    {
        return "ti ti-folder";
    }
}
