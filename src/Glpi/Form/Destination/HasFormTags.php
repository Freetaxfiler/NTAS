<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Destination;

use Attribute;

#[Attribute(Attribute::TARGET_CLASS)]
final class HasFormTags
{
    public function __construct() {}
}
