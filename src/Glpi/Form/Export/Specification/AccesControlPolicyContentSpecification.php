<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Export\Specification;

final class AccesControlPolicyContentSpecification implements ContentSpecificationInterface
{
    public string $strategy;
    public array $config;
    public bool $is_active;
}
