<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\ContentTemplates\Parameters;

use UserCategory;

/**
 * Parameters class for "UserCategory" items.
 *
 * @since 10.0.0
 */
class UserCategoryParameters extends DropdownParameters
{
    public static function getDefaultNodeName(): string
    {
        return 'usercategory';
    }

    public static function getObjectLabel(): string
    {
        return UserCategory::getTypeName(1);
    }

    protected function getTargetClasses(): array
    {
        return [UserCategory::class];
    }
}
