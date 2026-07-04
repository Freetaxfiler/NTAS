<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Destination;

interface ConfigFieldWithStrategiesInterface
{
    /**
     * Get strategies input name
     */
    public static function getStrategiesInputName(): string;

    /**
     * Get actual strategies
     *
     * @return array
     */
    public function getStrategies(): array;
}
