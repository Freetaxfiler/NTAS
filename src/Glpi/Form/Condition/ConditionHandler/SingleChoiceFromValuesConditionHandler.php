<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Condition\ConditionHandler;

use Glpi\Form\Condition\ConditionData;
use Glpi\Form\Condition\ValueOperator;
use Glpi\Form\Migration\ConditionHandlerDataConverterInterface;
use Override;

final class SingleChoiceFromValuesConditionHandler implements
    ConditionHandlerInterface,
    ConditionHandlerDataConverterInterface
{
    public function __construct(
        private array $values,
    ) {}

    #[Override]
    public function getSupportedValueOperators(): array
    {
        return [
            ValueOperator::EQUALS,
            ValueOperator::NOT_EQUALS,
            ValueOperator::LESS_THAN,
            ValueOperator::LESS_THAN_OR_EQUALS,
            ValueOperator::GREATER_THAN,
            ValueOperator::GREATER_THAN_OR_EQUALS,
        ];
    }

    #[Override]
    public function getTemplate(): string
    {
        return '/pages/admin/form/condition_handler_templates/dropdown.html.twig';
    }

    #[Override]
    public function getTemplateParameters(ConditionData $condition): array
    {
        return ['values' => $this->values];
    }

    #[Override]
    public function applyValueOperator(
        mixed $a,
        ValueOperator $operator,
        mixed $b,
    ): bool {
        // Normalize values as strings.
        if (is_array($a)) {
            $a = array_pop($a);
        }
        if (is_array($b)) {
            $b = array_pop($b);
        }
        $a = strtolower(strval($a));
        $b = strtolower(strval($b));

        return match ($operator) {
            ValueOperator::EQUALS                 => $a === $b,
            ValueOperator::NOT_EQUALS             => $a !== $b,
            ValueOperator::LESS_THAN              => $a < $b,
            ValueOperator::LESS_THAN_OR_EQUALS    => $a <= $b,
            ValueOperator::GREATER_THAN           => $a > $b,
            ValueOperator::GREATER_THAN_OR_EQUALS => $a >= $b,

            // Unsupported operators
            default => false,
        };
    }

    #[Override]
    public function convertConditionValue(string $value): int
    {
        return array_search($value, $this->values, true) ?: 0;
    }
}
