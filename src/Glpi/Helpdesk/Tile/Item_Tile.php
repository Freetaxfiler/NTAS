<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Helpdesk\Tile;

use CommonDBRelation;

final class Item_Tile extends CommonDBRelation
{
    // Linked CommonDBTM item
    public static $itemtype_1 = 'itemtype_item';
    public static $items_id_1 = 'items_id_item';

    // Linked CommonDBTM&TileInterface item
    public static $itemtype_2 = 'itemtype_tile';
    public static $items_id_2 = 'items_id_tile';
}
