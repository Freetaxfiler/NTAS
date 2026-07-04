<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class ContractType
class ContractType extends CommonType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Contract type', 'Contract types', $nb);
    }
}
