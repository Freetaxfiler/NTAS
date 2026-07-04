<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Condition;

interface StrategyInterface
{
    public function getLabel(): string;

    public function getIcon(): string;

    public function showEditor(): bool;
}
