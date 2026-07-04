<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Controller\Config\Helpdesk;

use Glpi\Exception\Http\AccessDeniedHttpException;
use RuntimeException;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class UpdateTileController extends AbstractTileController
{
    #[Route(
        "/Config/Helpdesk/UpdateTile",
        name: "ntas_config_helpdesk_update_tile",
        methods: "POST"
    )]
    public function __invoke(Request $request): Response
    {
        // Validate tile
        $tile = $this->getAndValidateTileFromRequest(
            $request->request->getString('_itemtype'),
            $request->request->getInt('id'),
        );
        if (!$tile::canUpdate() || !$tile->canUpdateItem()) {
            throw new AccessDeniedHttpException();
        }

        // Validate linked item
        $linked_item = $this->getAndValidateLinkedItemFromDatabase($tile);

        // Prepare input
        $input = $request->request->all();
        unset($input['_itemtype']);

        // Update the tile
        if (!$tile->update($input)) {
            throw new RuntimeException();
        }

        // Re-render the tile list
        $tiles = $this->tiles_manager->getTilesForItem($linked_item);
        return $this->render('pages/admin/helpdesk_home_config_tiles.html.twig', [
            'tiles_manager' => $this->tiles_manager,
            'tiles' => $tiles,
            // If we reach this point, the item was editable so we must keep
            // displaying the controls.
            'editable' => true,
        ]);
    }
}
