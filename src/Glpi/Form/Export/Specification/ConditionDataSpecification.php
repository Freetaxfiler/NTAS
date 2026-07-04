<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Export\Specification;

final class ConditionDataSpecification implements ContentSpecificationInterface
{
    public string $item_uuid;
    public string $item_type;
    public ?string $value_operator = null;
    public ?string $logic_operator = null;
    public mixed $value;
}
