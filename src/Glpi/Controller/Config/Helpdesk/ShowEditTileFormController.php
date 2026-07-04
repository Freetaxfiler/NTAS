<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Controller\Config\Helpdesk;

use Glpi\Exception\Http\AccessDeniedHttpException;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class ShowEditTileFormController extends AbstractTileController
{
    #[Route(
        "/Config/Helpdesk/ShowEditTileForm",
        name: "ntas_config_helpdesk_show_edit_tile_form",
        methods: "GET"
    )]
    public function __invoke(Request $request): Response
    {
        // Validate itemtype
        $tile = $this->getAndValidateTileFromRequest(
            $request->query->getString('tile_itemtype'),
            $request->query->getInt('tile_id'),
        );
        if (!$tile::canUpdate() || !$tile->canUpdateItem()) {
            throw new AccessDeniedHttpException();
        }

        // Render form
        return $this->render('pages/admin/helpdesk_home_config_edit_tile_form.html.twig', [
            'tile' => $tile,
        ]);
    }
}
