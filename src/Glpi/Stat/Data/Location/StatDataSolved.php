<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Stat\Data\Location;

use Session;
use Ticket;

class StatDataSolved extends StatDataLocation
{
    public function getKey(): string
    {
        return "solved";
    }

    public function getTitle(): string
    {
        return sprintf(
            __('Solved %1$s (%2$s)'),
            Ticket::getTypeName(Session::getPluralNumber()),
            $this->getTotal()
        );
    }
}
