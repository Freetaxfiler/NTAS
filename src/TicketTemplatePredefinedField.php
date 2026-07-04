<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * TicketTemplatePredefinedField Class
 *
 * Predefined fields for ticket template class
 *
 * @since 0.83
 **/
class TicketTemplatePredefinedField extends ITILTemplatePredefinedField
{
    // From CommonDBChild
    public static $itemtype = TicketTemplate::class;
    public static $items_id = 'tickettemplates_id';
    public static $itiltype = Ticket::class;
}
