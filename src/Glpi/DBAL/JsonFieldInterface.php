<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\DBAL;

use JsonSerializable;

/**
 * Base interface that can be used to type check any json configuration
 * from the database.
 */
interface JsonFieldInterface extends JsonSerializable
{
    /**
     * Create an instance from a raw array of data.
     *
     * @param array $data
     */
    public static function jsonDeserialize(array $data): self;
}
