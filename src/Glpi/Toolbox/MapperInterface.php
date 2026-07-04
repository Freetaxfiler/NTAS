<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Toolbox;

interface MapperInterface
{
    public function addMappedItem(string $itemtype, string|int $key, int $id): void;

    public function getItemId(string $itemtype, string|int $key): int;
}
