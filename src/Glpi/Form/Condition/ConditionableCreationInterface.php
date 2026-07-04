<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Condition;

interface ConditionableCreationInterface extends ConditionableInterface
{
    public function getConfiguredCreationStrategy(): CreationStrategy;

    // TODO: uncomment on main to prevent BC breaks
    // protected function removeSavedConditionsIfAlwaysCreated(array $input): array;
}
