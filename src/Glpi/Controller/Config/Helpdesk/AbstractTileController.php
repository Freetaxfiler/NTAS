<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Controller\Config\Helpdesk;

use CommonDBTM;
use Entity;
use Glpi\Controller\AbstractController;
use Glpi\Exception\Http\AccessDeniedHttpException;
use Glpi\Exception\Http\BadRequestHttpException;
use Glpi\Helpdesk\Tile\LinkableToTilesInterface;
use Glpi\Helpdesk\Tile\TileInterface;
use Glpi\Helpdesk\Tile\TilesManager;
use RuntimeException;

abstract class AbstractTileController extends AbstractController
{
    protected TilesManager $tiles_manager;

    public function __construct()
    {
        $this->tiles_manager = TilesManager::getInstance();
    }

    protected function getAndValidateLinkedItemFromDatabase(
        CommonDBTM&TileInterface $tile
    ): CommonDBTM&LinkableToTilesInterface {
        $link = $this->tiles_manager->getItemTileForTile($tile);
        $linked_itemtype = $link->fields['itemtype_item'];
        $linked_items_id = $link->fields['items_id_item'];
        $linked_item = getItemForItemtype($linked_itemtype);
        if (
            !$linked_item instanceof LinkableToTilesInterface
            || !$linked_item instanceof CommonDBTM
            || !$linked_item->getFromDB($linked_items_id)
        ) {
            // Invalid database data
            throw new RuntimeException();
        }
        if (!$linked_item::canUpdate() || !$linked_item->canUpdateItem()) {
            throw new AccessDeniedHttpException();
        }

        return $linked_item;
    }

    protected function getAndValidateLinkedEntityFromRequest(
        int $linked_entity_id,
    ): Entity {
        $linked_entity = new Entity();
        if (!$linked_entity->getFromDB($linked_entity_id)) {
            throw new BadRequestHttpException();
        }
        if (!$linked_entity::canUpdate() || !$linked_entity->canUpdateItem()) {
            throw new AccessDeniedHttpException();
        }

        return $linked_entity;
    }

    protected function getAndValidateLinkedItemFromRequest(
        string $linked_itemtype,
        int $linked_items_id,
    ): CommonDBTM&LinkableToTilesInterface {
        $linked_item = getItemForItemtype($linked_itemtype);
        if (
            !$linked_item instanceof LinkableToTilesInterface
            || !$linked_item instanceof CommonDBTM
            || !$linked_item->getFromDB($linked_items_id)
        ) {
            throw new BadRequestHttpException();
        }
        if (!$linked_item::canUpdate() || !$linked_item->canUpdateItem()) {
            throw new AccessDeniedHttpException();
        }

        return $linked_item;
    }

    protected function getAndValidateTileFromRequest(
        string $tile_itemtype,
        int $tile_id,
    ): CommonDBTM&TileInterface {
        $tile = getItemForItemtype($tile_itemtype);
        if (
            !$tile instanceof TileInterface
            || !$tile instanceof CommonDBTM
            || !$tile->getFromDB($tile_id)
        ) {
            throw new BadRequestHttpException();
        }

        return $tile;
    }
}
