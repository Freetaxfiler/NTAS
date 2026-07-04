<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Toolbox;

use CommonDBTM;

final class UuidStore
{
    use SingletonTrait;

    private array $store = [];

    public function addToStore(string $uuid, CommonDBTM $item): void
    {
        $this->store[$uuid] = $item;
    }

    public function get(string $uuid): ?CommonDBTM
    {
        return $this->store[$uuid] ?? null;
    }

    public function purge(): void
    {
        $this->store = [];
    }
}
