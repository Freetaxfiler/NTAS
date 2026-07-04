<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class TicketSatisfaction extends CommonITILSatisfaction
{
    public static $rightname = 'ticket';

    public static function getConfigSufix(): string
    {
        return "";
    }

    public static function getSearchOptionIDOffset(): int
    {
        return 0;
    }
}
