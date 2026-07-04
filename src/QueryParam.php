<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @deprecated 11.0.0
 */
class QueryParam extends Glpi\DBAL\QueryParam
{
    /**
     * @param string $expression
     * @phpstan-ignore constructor.unusedParameter
     */
    public function __construct($expression = '?')
    {
        Toolbox::deprecated('\QueryParam is deprecated, use \Glpi\DBAL\QueryParam instead');
    }
}
