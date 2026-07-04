<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Hidden fields for ticket template class
/// since version 0.83
class TicketTemplateHiddenField extends ITILTemplateHiddenField
{
    // From CommonDBChild
    public static $itemtype = TicketTemplate::class;
    public static $items_id  = 'tickettemplates_id';
    public static $itiltype = Ticket::class;
}
