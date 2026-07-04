<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class SoftwareLicenseType
class SoftwareLicenseType extends CommonTreeDropdown
{
    public $can_be_translated       = true;

    public static function getTypeName($nb = 0)
    {
        return _n('License type', 'License types', $nb);
    }

    public static function getFieldLabel()
    {
        return _n('Type', 'Types', 1);
    }

    public static function getIcon()
    {
        return SoftwareLicense::getIcon();
    }
}
