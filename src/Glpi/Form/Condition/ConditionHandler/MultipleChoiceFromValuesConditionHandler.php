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

final class MultipleChoiceFromValuesConditionHandler implements
    ConditionHandlerInterface,
    ConditionHandlerDataConverterInterface
{
    use ArrayConditionHandlerTrait;

    public function __construct(
        private array $values,
    ) {}

    #[Override]
    public function getSupportedValueOperators(): array
    {
        return $this->getSupportedArrayValueOperators();
    }

    #[Override]
    public function getTemplate(): string
    {
        return '/pages/admin/form/condition_handler_templates/dropdown_multiple.html.twig';
    }

    #[Override]
    public function getTemplateParameters(ConditionData $condition): array
    {
        return [
            'values' => $this->values,
        ];
    }

    #[Override]
    public function applyValueOperator(
        mixed $a,
        ValueOperator $operator,
        mixed $b,
    ): bool {
        return $this->applyArrayValueOperator($a, $operator, $b);
    }

    #[Override]
    public function convertConditionValue(string $value): array
    {
        $value = array_search($value, $this->values, true) ?: 0;
        return [$value];
    }
}
