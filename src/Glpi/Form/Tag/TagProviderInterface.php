<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Tag;

use Glpi\Form\AnswersSet;
use Glpi\Form\Form;

interface TagProviderInterface
{
    /**
     * Get the color of the tag.
     *
     * @return string
     */
    public function getTagColor(): string;

    /**
     * @return Tag[]
     */
    public function getTags(Form $form): array;

    public function getTagContentForValue(
        string $value,
        AnswersSet $answers_set
    ): string;

    public function getTagFromRawValue(string $value): ?Tag;
}
