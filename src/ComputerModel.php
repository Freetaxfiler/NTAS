<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class ComputerModel
class ComputerModel extends CommonDCModelDropdown
{
    public static function getTypeName($nb = 0)
    {
        return _n('Computer model', 'Computer models', $nb);
    }
}
