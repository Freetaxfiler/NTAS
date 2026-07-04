<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Controller\Config\Helpdesk;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class SetTilesOrderController extends AbstractTileController
{
    #[Route(
        "/Config/Helpdesk/SetTilesOrder",
        name: "ntas_config_helpdesk_set_tiles_order",
        methods: "POST"
    )]
    public function __invoke(Request $request): Response
    {
        // Validate linked item
        $linked_item = $this->getAndValidateLinkedItemFromRequest(
            linked_itemtype: $request->request->getString('itemtype_item'),
            linked_items_id: $request->request->getInt('items_id_item'),
        );

        // Apply new order
        $order = $request->request->all()['order'];
        $this->tiles_manager->setOrderForItem($linked_item, $order);

        // Reload tiles
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
