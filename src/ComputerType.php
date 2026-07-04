<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class ComputerType
class ComputerType extends CommonType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Computer type', 'Computer types', $nb);
    }
}
