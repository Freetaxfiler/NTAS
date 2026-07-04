<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Export\Specification;

final class CustomTypeRequirementSpecification
{
    public function __construct(
        public string $itemtype = "",
    ) {}
}
