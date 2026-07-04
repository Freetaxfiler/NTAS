<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\ContentTemplates\Parameters;

use OLA;

/**
 * Parameters for "OLA" items.
 *
 * @since 10.0.0
 */
class OLAParameters extends LevelAgreementParameters
{
    public static function getDefaultNodeName(): string
    {
        return 'ola';
    }

    public static function getObjectLabel(): string
    {
        return OLA::getTypeName(1);
    }

    protected function getTargetClasses(): array
    {
        return [OLA::class];
    }
}
