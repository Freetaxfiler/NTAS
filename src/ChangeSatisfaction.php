<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class ChangeSatisfaction extends CommonITILSatisfaction
{
    public static $rightname = 'change';

    public static function getConfigSufix(): string
    {
        return "_change";
    }

    public static function getSearchOptionIDOffset(): int
    {
        return 200;
    }
}
