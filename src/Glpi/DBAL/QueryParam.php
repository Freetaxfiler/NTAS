<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\DBAL;

class QueryParam
{
    /**
     * Query parameter value.
     *
     * @return string
     */
    public function getValue()
    {
        return '?';
    }

    public function __toString()
    {
        return $this->getValue();
    }
}
