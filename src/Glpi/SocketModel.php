<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi;

use CommonDropdown;

/// Class ConnectorModel
class SocketModel extends CommonDropdown
{
    public static function getTypeName($nb = 0)
    {
        return _n('Socket model', 'Socket models', $nb);
    }


    public static function getFieldLabel()
    {
        return _n('Model', 'Models', 1);
    }
}
