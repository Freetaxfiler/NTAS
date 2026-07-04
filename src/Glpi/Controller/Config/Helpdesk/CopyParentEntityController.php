<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Controller\Config\Helpdesk;

use Glpi\Http\RedirectResponse;
use Html;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class CopyParentEntityController extends AbstractTileController
{
    #[Route(
        "/Config/Helpdesk/CopyParentEntity",
        name: "ntas_config_helpdesk_copy_parent_entity",
        methods: "POST"
    )]
    public function __invoke(Request $request): Response
    {
        // Validate itemtype
        $entity = $this->getAndValidateLinkedEntityFromRequest(
            $request->request->getInt('entities_id'),
        );
        $this->tiles_manager->copyTilesFromParentEntity($entity);

        return new RedirectResponse(Html::getBackUrl());
    }
}
