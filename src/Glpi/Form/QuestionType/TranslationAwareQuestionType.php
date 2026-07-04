<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\QuestionType;

use Glpi\Form\Question;
use Glpi\ItemTranslation\Context\TranslationHandler;

/**
 * Must be implemented by question that provide translations.
 */
interface TranslationAwareQuestionType
{
    /**
     * Returns the list of form translations handlers.
     *
     * @return array<int, TranslationHandler>
     */
    public function listTranslationsHandlers(Question $question): array;
}
