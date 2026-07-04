<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Condition\ConditionHandler;

use Glpi\Form\Condition\ConditionData;
use Override;

final class DateAndTimeConditionHandler extends AbstractDateTimeConditionHandler
{
    #[Override]
    public function getTemplateParameters(ConditionData $condition): array
    {
        return ['attributes' => ['type' => 'datetime-local']];
    }
}
