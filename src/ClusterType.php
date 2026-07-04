<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class ClusterType extends CommonType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Cluster type', 'Cluster types', $nb);
    }
}
