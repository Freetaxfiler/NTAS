<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\QuestionType;

use Glpi\DBAL\JsonFieldInterface;
use Override;

final class QuestionTypeItemDefaultValueConfig implements JsonFieldInterface
{
    // Unique reference to hardcoded name used for serialization
    public const KEY_ITEMS_ID = "items_id";

    /**
     * @param null|int|string $items_id Must accept a string because the foreign key handler
     *                                  replaces the ID with the item name during serialization.
     */
    public function __construct(
        private int|string|null $items_id = null
    ) {}

    #[Override]
    public static function jsonDeserialize(array $data): self
    {
        return new self(
            items_id: $data[self::KEY_ITEMS_ID] ?? null,
        );
    }

    #[Override]
    public function jsonSerialize(): array
    {
        return [
            self::KEY_ITEMS_ID => $this->items_id,
        ];
    }

    public function getItemsId(): ?int
    {
        return $this->items_id;
    }
}
