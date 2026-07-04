<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Destination\CommonITILField;

use CommonITILObject;
use Glpi\DBAL\JsonFieldInterface;
use Glpi\Form\Destination\ConfigFieldWithStrategiesInterface;
use Glpi\Form\Destination\HasFieldWithQuestionId;
use Override;

#[HasFieldWithQuestionId(self::SPECIFIC_QUESTION_IDS, is_array: true)]
final class AssociatedItemsFieldConfig implements
    JsonFieldInterface,
    ConfigFieldWithStrategiesInterface
{
    // Unique reference to hardcoded names used for serialization and forms input names
    public const STRATEGIES = 'strategies';
    public const SPECIFIC_QUESTION_IDS = 'specific_question_ids';
    public const SPECIFIC_ASSOCIATED_ITEMS = 'specific_associated_items';

    /**
     * @param array<AssociatedItemsFieldStrategy> $strategies
     * @param array<int> $specific_question_ids
     * @param array<CommonITILObject> $specific_associated_items
     */
    public function __construct(
        private array $strategies,
        private array $specific_question_ids = [],
        private array $specific_associated_items = [],
    ) {}

    #[Override]
    public static function jsonDeserialize(array $data): self
    {
        $strategies = array_map(
            fn(string $strategy) => AssociatedItemsFieldStrategy::tryFrom($strategy),
            $data[self::STRATEGIES] ?? []
        );
        if ($strategies === []) {
            $strategies = [AssociatedItemsFieldStrategy::ALL_VALID_ANSWERS];
        }

        return new self(
            strategies: $strategies,
            specific_question_ids: $data[self::SPECIFIC_QUESTION_IDS] ?? [],
            specific_associated_items: $data[self::SPECIFIC_ASSOCIATED_ITEMS] ?? [],
        );
    }

    #[Override]
    public function jsonSerialize(): array
    {
        return [
            self::STRATEGIES                => array_map(
                fn(AssociatedItemsFieldStrategy $strategy) => $strategy->value,
                $this->strategies
            ),
            self::SPECIFIC_QUESTION_IDS     => $this->specific_question_ids,
            self::SPECIFIC_ASSOCIATED_ITEMS => $this->specific_associated_items,
        ];
    }

    #[Override]
    public static function getStrategiesInputName(): string
    {
        return self::STRATEGIES;
    }

    /**
     * @return array<AssociatedItemsFieldStrategy>
     */
    public function getStrategies(): array
    {
        return $this->strategies;
    }

    public function getSpecificQuestionIds(): array
    {
        return $this->specific_question_ids;
    }

    public function getSpecificAssociatedItems(): array
    {
        return $this->specific_associated_items;
    }
}
