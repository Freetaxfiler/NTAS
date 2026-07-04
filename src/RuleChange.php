<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleChange extends RuleCommonITILObject
{
    // From Rule
    public static $rightname = 'rule_change';

    public function getTitle()
    {
        return __('Business rules for changes');
    }

    #[Override]
    public function getTargetItilType(): Change
    {
        return new Change();
    }
}
