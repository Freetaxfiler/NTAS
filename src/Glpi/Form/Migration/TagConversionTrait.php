<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Migration;

use Glpi\Form\Question;
use Glpi\Form\Tag\AnswerTagProvider;
use Glpi\Form\Tag\QuestionTagProvider;

use function Safe\preg_match_all;

/**
 * Provides common functionality for converting legacy tags to new format
 */
trait TagConversionTrait
{
    /**
     * Convert legacy tags in the format ##question_ID## or ##answer_ID## to new tag format
     *
     * @param string $content Content containing legacy tags
     * @param FormMigration $migration Migration object for ID mapping
     * @return string Content with converted tags
     */
    protected function convertLegacyTags(string $content, FormMigration $migration): string
    {
        // Skip processing if content is just the full form placeholder
        if (strip_tags($content) === '##FULLFORM##') {
            return $content;
        }

        preg_match_all('/##(question_\d+|answer_\d+)##/', $content, $tags);
        foreach ($tags[1] as $tag) {
            $type = explode('_', $tag)[0];
            $item_id = (int) explode('_', $tag)[1];

            // Get mapped question ID
            $target = $migration->getMappedItemTarget(
                'PluginFormcreatorQuestion',
                $item_id
            );

            if (empty($target)) {
                // Log this issue or handle the missing mapping
                continue;
            }

            $question_id = $target['items_id'];
            $question = Question::getById($question_id);

            if (!$question) {
                // Log this issue or handle the missing question
                continue;
            }

            $new_tag = match ($type) {
                'question' => (new QuestionTagProvider())->getTagForQuestion($question),
                'answer' => (new AnswerTagProvider())->getTagForQuestion($question),
                default => null,
            };

            if ($new_tag) {
                $content = str_replace("##$tag##", $new_tag->html, $content);
            }
        }

        return $content;
    }
}
