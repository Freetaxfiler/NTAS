<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @deprecated 11.0.0
 */
class QuerySubQuery extends Glpi\DBAL\QuerySubQuery
{
    /**
     * @param array   $expression Array of query criteria. Any valid DBmysqlIterator parameters are valid.
     * @param ?string $alias      Alias for the whole subquery
     */
    public function __construct($expression, $alias = null)
    {
        Toolbox::deprecated('\QuerySubQuery is deprecated, use \Glpi\DBAL\QuerySubQuery instead');
        parent::__construct($expression, $alias);
    }
}
