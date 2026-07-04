<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @deprecated 11.0.0
 */
class QueryUnion extends Glpi\DBAL\QueryUnion
{
    /**
     * @param array $expression
     */
    public function __construct($expression)
    {
        Toolbox::deprecated('\QueryUnion is deprecated, use \Glpi\DBAL\QueryUnion instead');
        parent::__construct($expression);
    }
}
