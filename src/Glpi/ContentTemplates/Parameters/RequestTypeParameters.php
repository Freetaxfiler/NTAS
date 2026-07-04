<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\ContentTemplates\Parameters;

use RequestType;

/**
 * Parameters for "RequestType" items.
 *
 * @since 10.0.0
 */
class RequestTypeParameters extends DropdownParameters
{
    public static function getDefaultNodeName(): string
    {
        return 'requesttype';
    }

    public static function getObjectLabel(): string
    {
        return RequestType::getTypeName(1);
    }

    protected function getTargetClasses(): array
    {
        return [RequestType::class];
    }
}
