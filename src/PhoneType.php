<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class PhoneType
class PhoneType extends CommonType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Phone type', 'Phone types', $nb);
    }
}
