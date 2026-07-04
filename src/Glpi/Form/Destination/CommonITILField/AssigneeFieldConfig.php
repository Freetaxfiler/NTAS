<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Destination\CommonITILField;

use Glpi\Form\Destination\HasFieldWithQuestionId;
use Override;

#[HasFieldWithQuestionId(self::SPECIFIC_QUESTION_IDS, is_array: true)]
final class AssigneeFieldConfig extends ITILActorFieldConfig
{
    #[Override]
    public static function jsonDeserialize(array $data): self
    {
        $strategies = array_map(
            fn(string $strategy) => ITILActorFieldStrategy::tryFrom($strategy),
            $data[self::STRATEGIES] ?? []
        );
        if ($strategies === []) {
            $strategies = [ITILActorFieldStrategy::FROM_TEMPLATE];
        }

        return new self(
            strategies: $strategies,
            specific_itilactors_ids: $data[self::SPECIFIC_ITILACTORS_IDS] ?? [],
            specific_question_ids: $data[self::SPECIFIC_QUESTION_IDS] ?? [],
        );
    }
}
