<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleProblem extends RuleCommonITILObject
{
    // From Rule
    public static $rightname = 'rule_problem';

    public function getTitle()
    {
        return __('Business rules for problems');
    }

    #[Override]
    public function getTargetItilType(): Problem
    {
        return new Problem();
    }
}
