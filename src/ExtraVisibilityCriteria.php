<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

interface ExtraVisibilityCriteria
{
    /**
     * Return visibility joins to add to DBIterator parameters
     *
     * @since 9.5
     *
     * @param bool $forceall force all joins (false by default)
     *
     * @return array
     */
    public static function getVisibilityCriteria(bool $forceall = false): array;
}
