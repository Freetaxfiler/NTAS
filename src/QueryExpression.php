<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @deprecated 11.0.0
 */
class QueryExpression extends Glpi\DBAL\QueryExpression
{
    /**
     * Create a query expression
     *
     * @param string $expression The query expression
     */
    public function __construct($expression)
    {
        Toolbox::deprecated('\QueryExpression is deprecated, use \Glpi\DBAL\QueryExpression instead');
        parent::__construct($expression);
    }
}
