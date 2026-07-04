<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class Filesystem
class VirtualMachineState extends CommonDropdown
{
    public static function getTypeName($nb = 0)
    {
        return _n('State of the virtual machine', 'States of the virtual machine', $nb);
    }
}
