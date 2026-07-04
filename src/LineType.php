<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class LineType extends CommonType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Line type', 'Line types', $nb);
    }
}
