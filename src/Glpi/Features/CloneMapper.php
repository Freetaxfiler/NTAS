<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Features;

use Glpi\Toolbox\MapperInterface;
use Glpi\Toolbox\SingletonTrait;
use InvalidArgumentException;
use Override;

final class CloneMapper implements MapperInterface
{
    use SingletonTrait;

    /** @var array<class-string<\CommonDBTM>, array<int, int>> */
    private array $mapped_ids = [];

    #[Override]
    /** @param class-string<\CommonDBTM> $class */
    public function addMappedItem(string $class, string|int $old_id, int $new_id): void
    {
        if (!isset($this->mapped_ids[$class])) {
            $this->mapped_ids[$class] = [];
        }

        $this->mapped_ids[$class][$old_id] = $new_id;
    }

    #[Override]
    /** @param class-string<\CommonDBTM> $class */
    public function getItemId(string $class, string|int $old_id): int
    {
        $new_id = $this->mapped_ids[$class][$old_id] ?? null;
        if (!$new_id) {
            $target = "$class::$old_id";
            throw new InvalidArgumentException("Item $target was never cloned");
        }

        return $this->mapped_ids[$class][$old_id];
    }

    public function cleanMappedIds(): void
    {
        $this->mapped_ids = [];
    }
}
