<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Export\Specification;

final class SectionContentSpecification
{
    public int $id;
    public string $uuid;
    public string $name;
    public ?string $description = null;
    public int $rank;
    public string $visibility_strategy;

    /** @var ConditionDataSpecification[] $conditions */
    public array $conditions;
}
