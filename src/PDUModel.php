<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class PDUModel
class PDUModel extends CommonDCModelDropdown
{
    public static function getTypeName($nb = 0)
    {
        return _n('PDU model', 'PDU models', $nb);
    }
}
