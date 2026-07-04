<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Stat\Data\Location;

use Session;
use Ticket;

class StatDataClosed extends StatDataLocation
{
    public function getKey(): string
    {
        return "closed";
    }

    public function getTitle(): string
    {
        return sprintf(
            __('Closed %1$s (%2$s)'),
            Ticket::getTypeName(Session::getPluralNumber()),
            $this->getTotal()
        );
    }
}
