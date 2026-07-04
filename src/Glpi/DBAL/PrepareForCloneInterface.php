<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\DBAL;

interface PrepareForCloneInterface
{
    /**
     * @param array<int|string, mixed> $data
     *
     * @return array<int|string, mixed>
     */
    public function prepareInputForClone(array $data): array;
}
