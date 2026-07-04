<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class PhoneModel
class PhoneModel extends CommonDropdown
{
    public $additional_fields_for_dictionnary = ['manufacturer'];


    public static function getTypeName($nb = 0)
    {
        return _n('Phone model', 'Phone models', $nb);
    }


    public static function getFieldLabel()
    {
        return _n('Model', 'Models', 1);
    }

    public static function getIcon()
    {
        return Phone::getIcon();
    }
}
