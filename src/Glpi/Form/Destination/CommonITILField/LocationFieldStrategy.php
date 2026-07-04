<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Destination\CommonITILField;

use Glpi\Form\Answer;
use Glpi\Form\AnswersSet;
use Glpi\Form\QuestionType\QuestionTypeItemDropdown;
use Location;

enum LocationFieldStrategy: string
{
    case FROM_TEMPLATE = 'from_template';
    case SPECIFIC_VALUE = 'specific_value';
    case SPECIFIC_ANSWER = 'specific_answer';
    case LAST_VALID_ANSWER = 'last_valid_answer';

    public function getLabel(): string
    {
        return match ($this) {
            self::FROM_TEMPLATE     => __("From template"),
            self::SPECIFIC_VALUE    => __("Specific location"),
            self::SPECIFIC_ANSWER   => __("Answer from a specific question"),
            self::LAST_VALID_ANSWER => __('Answer to last "Location" dropdown question'),
        };
    }

    public function getLocationID(
        LocationFieldConfig $config,
        AnswersSet $answers_set,
    ): ?int {
        return match ($this) {
            self::FROM_TEMPLATE => null, // Let the template apply its default value by itself.
            self::SPECIFIC_VALUE => $config->getSpecificLocationID(),
            self::SPECIFIC_ANSWER => $this->getLocationIDForSpecificAnswer(
                $config->getSpecificQuestionId(),
                $answers_set
            ),
            self::LAST_VALID_ANSWER => $this->getLocationIDForLastValidAnswer($answers_set),
        };
    }

    private function getLocationIDForSpecificAnswer(
        ?int $question_id,
        AnswersSet $answers_set,
    ): ?int {
        if ($question_id === null) {
            return null;
        }

        $answer = $answers_set->getAnswerByQuestionId($question_id);
        if ($answer === null) {
            return null;
        }

        $value = $answer->getRawAnswer();
        if ($value['itemtype'] !== Location::getType() || !is_numeric($value['items_id'])) {
            return null;
        }

        return (int) $value['items_id'];
    }

    private function getLocationIDForLastValidAnswer(
        AnswersSet $answers_set,
    ): ?int {
        $items_answers = $answers_set->getAnswersByType(
            QuestionTypeItemDropdown::class
        );
        $location_answers = array_filter(
            $items_answers,
            fn(Answer $a) => ($a->getRawAnswer()['itemtype'] ?? '') === Location::class,
        );
        if (count($location_answers) == 0) {
            return null;
        }

        $answer = end($location_answers);
        $value = $answer->getRawAnswer();
        if (!is_numeric($value['items_id'])) {
            return null;
        }

        return (int) $value['items_id'];
    }
}
