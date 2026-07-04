<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * DocumentType Class
 **/
class BusinessCriticity extends CommonTreeDropdown
{
    public $can_be_translated = true;

    public static function getTypeName($nb = 0)
    {
        return _n('Business criticity', 'Business criticities', $nb);
    }

    public static function getIcon()
    {
        return "ti ti-briefcase";
    }
}
