<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Export\Specification;

final class DestinationContentSpecification implements ContentSpecificationInterface
{
    public int $id;
    public string $itemtype;
    public string $name;
    public array $config;
    public string $creation_strategy;

    /** @var ConditionDataSpecification[] $conditions */
    public array $conditions;
}
