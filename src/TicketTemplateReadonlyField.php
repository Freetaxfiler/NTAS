<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Readonly fields for ticket template class
/// since version 11.0.0
class TicketTemplateReadonlyField extends ITILTemplateReadonlyField
{
    // From CommonDBChild
    public static $itemtype = TicketTemplate::class;
    public static $items_id  = 'tickettemplates_id';
    public static $itiltype = Ticket::class;
}
