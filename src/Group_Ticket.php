<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Group_Ticket Class
 *
 * @since 0.85
 *
 * Relation between Groups and Tickets
 **/
class Group_Ticket extends CommonITILActor
{
    // From CommonDBRelation
    public static $itemtype_1 = Ticket::class;
    public static $items_id_1 = 'tickets_id';
    public static $itemtype_2 = Group::class;
    public static $items_id_2 = 'groups_id';
}
