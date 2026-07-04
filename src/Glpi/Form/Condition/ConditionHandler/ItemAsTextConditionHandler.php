<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Condition\ConditionHandler;

use Glpi\Form\Condition\ConditionData;
use Glpi\Form\Condition\ValueOperator;
use Override;

/**
 * Allow text comparison on items using contains operator.
 */
final class ItemAsTextConditionHandler implements ConditionHandlerInterface
{
    public function __construct(
        private string $itemtype,
    ) {}

    #[Override]
    public function getSupportedValueOperators(): array
    {
        return [
            ValueOperator::CONTAINS,
            ValueOperator::NOT_CONTAINS,
        ];
    }

    #[Override]
    public function getTemplate(): string
    {
        return '/pages/admin/form/condition_handler_templates/input.html.twig';
    }

    #[Override]
    public function getTemplateParameters(ConditionData $condition): array
    {
        return [];
    }

    #[Override]
    public function applyValueOperator(
        mixed $a,
        ValueOperator $operator,
        mixed $b,
    ): bool {
        // $a is the submitted answer
        if (!is_array($a) || !isset($a['items_id'])) {
            return false;
        }

        $item = $this->itemtype::getById($a['items_id']);
        if (!$item) {
            return false;
        }
        $a = $item->getName();

        // Normalize values
        $a = strtolower(strval($a));
        $b = strtolower(strval($b));

        return match ($operator) {
            ValueOperator::CONTAINS     => str_contains($a, $b),
            ValueOperator::NOT_CONTAINS => !str_contains($a, $b),

            // Unsupported operators
            default => false,
        };
    }
}
