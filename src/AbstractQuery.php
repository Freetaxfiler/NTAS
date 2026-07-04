<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 *  Sub query class
 **/
abstract class AbstractQuery
{
    /** @var ?string */
    protected $alias = null;

    /**
     * Create a query
     *
     * @param string $alias Alias for the whole subquery
     */
    public function __construct($alias = null)
    {
        $this->alias = $alias;
    }

    /**
     * Get alias
     *
     * @return string|null
     */
    public function getAlias()
    {
        return $this->alias;
    }

    /**
     *
     * Get SQL query
     *
     * @return string
     *
     * @psalm-taint-escape sql
     */
    abstract public function getQuery();

    public function __toString()
    {
        return $this->getQuery();
    }
}
