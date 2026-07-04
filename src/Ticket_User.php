<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class Ticket_User
class Ticket_User extends CommonITILActor
{
    // From CommonDBRelation
    public static $itemtype_1 = Ticket::class;
    public static $items_id_1 = 'tickets_id';
    public static $itemtype_2 = User::class;
    public static $items_id_2 = 'users_id';
}
