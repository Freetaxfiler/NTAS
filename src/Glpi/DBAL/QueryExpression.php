<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\DBAL;

use RuntimeException;

/**
 *  Query expression class
 **/
class QueryExpression
{
    private string $expression;

    private ?string $alias;

    /**
     * Create a query expression
     *
     * @param string $expression The query expression
     * @param ?string $alias     The query expression alias
     */
    public function __construct($expression, ?string $alias = null)
    {
        if ($expression === null || $expression === '' || $expression === false) {
            throw new RuntimeException('Cannot build an empty expression');
        }
        $this->expression = $expression;
        $this->alias = $alias;
    }

    /**
     * Query expression value
     *
     * @return string
     *
     * @psalm-taint-escape sql
     */
    public function getValue()
    {
        global $DB;
        $sql = $this->expression;
        if (!empty($this->alias)) {
            $sql .= ' AS ' . $DB::quoteName($this->alias);
        }
        return $sql;
    }

    public function __toString()
    {
        return $this->getValue();
    }
}
