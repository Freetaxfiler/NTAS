<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Condition\ConditionHandler;

use Glpi\Form\Condition\ValueOperator;
use Override;

final class RichTextConditionHandler extends StringConditionHandler implements ConditionHandlerInterface
{
    #[Override]
    public function applyValueOperator(
        mixed $a,
        ValueOperator $operator,
        mixed $b,
    ): bool {
        // Remove HTML tags.
        $a = strip_tags(strval($a));
        $b = strip_tags(strval($b));

        return parent::applyValueOperator($a, $operator, $b);
    }
}
