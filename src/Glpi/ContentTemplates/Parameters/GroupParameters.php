<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\ContentTemplates\Parameters;

use Group;

/**
 * Parameters for "Group" items.
 *
 * @since 10.0.0
 */
class GroupParameters extends TreeDropdownParameters
{
    public static function getDefaultNodeName(): string
    {
        return 'group';
    }

    public static function getObjectLabel(): string
    {
        return Group::getTypeName(1);
    }

    protected function getTargetClasses(): array
    {
        return [Group::class];
    }
}
