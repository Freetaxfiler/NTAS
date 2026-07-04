<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Features;

/**
 * Trait Kanban.
 * @since 9.5.0
 */
trait Timeline
{
    abstract public function getTimelineItemtypes(): array;
}
