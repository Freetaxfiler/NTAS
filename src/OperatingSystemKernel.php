<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class OperatingSystemKernel extends CommonDropdown
{
    public $can_be_translated = false;

    public static function getTypeName($nb = 0)
    {
        return _n('Kernel', 'Kernels', $nb);
    }
}
