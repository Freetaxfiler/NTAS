<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class SupplierType
class SupplierType extends CommonType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Third party type', 'Third party types', $nb);
    }
}
