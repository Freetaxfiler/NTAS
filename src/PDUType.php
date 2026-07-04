<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class PDUType
class PDUType extends CommonType
{
    public static function getTypeName($nb = 0)
    {
        return _n('PDU type', 'PDU types', $nb);
    }
}
