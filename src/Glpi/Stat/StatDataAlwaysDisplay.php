<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Stat;

/**
 * Data for front/stat.graph.php
 */
abstract class StatDataAlwaysDisplay extends StatData
{
    public function isEmpty(): bool
    {
        // Force display even if no data
        return false;
    }
}
