<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Condition\ConditionHandler;

use Glpi\Form\Condition\ValueOperator;
use Override;

abstract class AbstractDateTimeConditionHandler implements ConditionHandlerInterface
{
    #[Override]
    public function getSupportedValueOperators(): array
    {
        return [
            ValueOperator::EQUALS,
            ValueOperator::NOT_EQUALS,
            ValueOperator::GREATER_THAN,
            ValueOperator::GREATER_THAN_OR_EQUALS,
            ValueOperator::LESS_THAN,
            ValueOperator::LESS_THAN_OR_EQUALS,
        ];
    }

    #[Override]
    public function getTemplate(): string
    {
        return '/pages/admin/form/condition_handler_templates/input.html.twig';
    }

    #[Override]
    public function applyValueOperator(
        mixed $a,
        ValueOperator $operator,
        mixed $b,
    ): bool {
        // Date can be compared as simple strings.
        $a = strtolower(strval($a));
        $b = strtolower(strval($b));

        return match ($operator) {
            ValueOperator::EQUALS                 => $a === $b,
            ValueOperator::NOT_EQUALS             => $a !== $b,
            ValueOperator::GREATER_THAN           => $a > $b,
            ValueOperator::GREATER_THAN_OR_EQUALS => $a >= $b,
            ValueOperator::LESS_THAN              => $a < $b,
            ValueOperator::LESS_THAN_OR_EQUALS    => $a <= $b,

            // Unsupported operators
            default => false,
        };
    }
}
