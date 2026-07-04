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

final class ShowAddTileFormController extends AbstractTileController
{
    #[Route(
        "/Config/Helpdesk/ShowAddTileForm",
        name: "ntas_config_helpdesk_show_add_tile_form",
        methods: "GET"
    )]
    public function __invoke(Request $request): Response
    {
        $possible_tiles = [];
        foreach ($this->tiles_manager->getTileTypes() as $tile_type) {
            if ($tile_type::canCreate()) {
                $possible_tiles[] = $tile_type;
            }
        }
        if ($possible_tiles === []) {
            throw new AccessDeniedHttpException();
        }

        $possible_tiles_dropdown_values = [];
        foreach ($possible_tiles as $possible_tile) {
            $possible_tiles_dropdown_values[$possible_tile::class] = $possible_tile->getLabel();
        }

        // Render form
        return $this->render('pages/admin/helpdesk_home_config_add_tile_form.html.twig', [
            'possible_tiles' => $possible_tiles,
            'possible_tiles_dropdown_values' => $possible_tiles_dropdown_values,
        ]);
    }
}
