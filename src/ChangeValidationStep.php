<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

final class ChangeValidationStep extends ITIL_ValidationStep
{
    public static $rightname = 'changevalidation';
    public static string $validation_classname = ChangeValidation::class;

    public static function getTypeName($nb = 0)
    {
        return _n('Change Approval step', 'Change Approval steps', $nb);
    }
}
