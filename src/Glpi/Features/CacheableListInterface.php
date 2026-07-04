<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Features;

/**
 * Objects lists that can be cached
 **/
interface CacheableListInterface
{
    /**
     * Get cache key
     *
     * @return string
     */
    public function getListCacheKey(): string;

    /**
     * Clean cache
     *
     * @return void
     */
    public function invalidateListCache(): void;
}
