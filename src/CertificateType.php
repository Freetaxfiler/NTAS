<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Class to manage certificate types
 */
class CertificateType extends CommonType
{
    public $can_be_translated = true;

    public static function getTypeName($nb = 0)
    {
        return _n('Certificate type', 'Certificate types', $nb);
    }
}
