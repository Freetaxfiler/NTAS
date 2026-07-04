<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Search;

interface DefaultSearchRequestInterface
{
    public static function getDefaultSearchRequest(): array;
}
