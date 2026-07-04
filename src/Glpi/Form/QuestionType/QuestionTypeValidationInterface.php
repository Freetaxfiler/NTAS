<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\QuestionType;

use Glpi\Form\Question;
use Glpi\Form\ValidationResult;

/**
 * Questions type that require extra validation must implement this interface
 */
interface QuestionTypeValidationInterface
{
    public function validateAnswer(
        Question $question,
        mixed $answer,
    ): ValidationResult;
}
