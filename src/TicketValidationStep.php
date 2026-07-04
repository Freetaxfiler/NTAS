<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

final class TicketValidationStep extends ITIL_ValidationStep
{
    public static $rightname = 'ticketvalidation';
    public static string $validation_classname = TicketValidation::class;

    public static function getTypeName($nb = 0)
    {
        return _n('Ticket approval step', 'Ticket approval steps', $nb);
    }
}
