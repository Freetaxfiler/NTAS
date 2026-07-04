<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class ContactType
class ContactType extends CommonType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Contact type', 'Contact types', $nb);
    }
}
