<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class EnclosureModel
class EnclosureModel extends CommonDCModelDropdown
{
    public static function getTypeName($nb = 0)
    {
        return _n('Enclosure model', 'Enclosure models', $nb);
    }
}
