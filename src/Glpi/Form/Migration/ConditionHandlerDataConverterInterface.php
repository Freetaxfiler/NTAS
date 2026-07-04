<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Migration;

interface ConditionHandlerDataConverterInterface
{
    /**
     * Convert conditions value
     *
     * @param string $value
     * @return mixed
     */
    public function convertConditionValue(string $value): mixed;
}
