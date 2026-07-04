<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Features;

use Attribute;
use CommonDBTM;
use ReflectionClass;

/**
 * Allow an item to be cloned without the (copy %d) suffix.
*/
#[Attribute(Attribute::TARGET_CLASS)]
final class CloneWithoutNameSuffix
{
    public static function objectHasAttribute(CommonDBTM $item): bool
    {
        $reflection = new ReflectionClass($item);
        $attributes = $reflection->getAttributes(self::class);
        return count($attributes) > 0;
    }
}
