<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Condition\ConditionHandler;

use Glpi\DBAL\JsonFieldInterface;
use Glpi\Form\Condition\ConditionData;
use Glpi\Form\Condition\ConditionValueTransformerInterface;
use Glpi\Form\Condition\ValueOperator;
use Glpi\Form\QuestionType\QuestionTypeInterface;
use Override;

/**
 * Handler for conditions that check if another form element is empty or not
 */
class EmptyConditionHandler implements ConditionHandlerInterface
{
    public function __construct(
        private QuestionTypeInterface $question_type,
        private ?JsonFieldInterface $question_config
    ) {}

    #[Override]
    public function getSupportedValueOperators(): array
    {
        return [
            ValueOperator::EMPTY,
            ValueOperator::NOT_EMPTY,
        ];
    }

    #[Override]
    public function getTemplate(): null
    {
        // No input field needed for empty conditions
        return null;
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
        if ($this->question_type instanceof ConditionValueTransformerInterface) {
            $a = $this->question_type->transformConditionValueForComparisons($a, $this->question_config);
        }

        return match ($operator) {
            ValueOperator::EMPTY     => empty($a),
            ValueOperator::NOT_EMPTY => !empty($a),

            // Unsupported operators
            default => false,
        };
    }
}
