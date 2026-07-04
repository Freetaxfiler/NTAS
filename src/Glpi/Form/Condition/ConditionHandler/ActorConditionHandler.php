<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Condition\ConditionHandler;

use Glpi\Form\Condition\ConditionData;
use Glpi\Form\Condition\ValueOperator;
use Glpi\Form\QuestionType\AbstractQuestionTypeActors;
use Glpi\Form\QuestionType\QuestionTypeActorsExtraDataConfig;
use Override;

class ActorConditionHandler implements ConditionHandlerInterface
{
    use ArrayConditionHandlerTrait;

    public function __construct(
        private AbstractQuestionTypeActors $question_type,
        private QuestionTypeActorsExtraDataConfig $extra_data_config,
    ) {}

    #[Override]
    public function getSupportedValueOperators(): array
    {
        return $this->getSupportedArrayValueOperators();
    }

    #[Override]
    public function getTemplate(): string
    {
        return '/pages/admin/form/condition_handler_templates/actor.html.twig';
    }

    #[Override]
    public function getTemplateParameters(ConditionData $condition): array
    {
        return [
            'multiple'       => $this->extra_data_config->isMultipleActors(),
            'allowed_actors' => $this->question_type->getAllowedActorTypes(),
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
}
