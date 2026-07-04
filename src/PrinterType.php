<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class PrinterType
class PrinterType extends CommonType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Printer type', 'Printer types', $nb);
    }
}
