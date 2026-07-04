<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Controller;

use Glpi\Http\Firewall;
use Glpi\Http\RedirectResponse;
use Glpi\Security\Attribute\SecurityStrategy;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class WellKnownController extends AbstractController
{
    /**
     *  Handle well-known URIs as defined in RFC 5785.
     *  https://www.iana.org/assignments/well-known-uris/well-known-uris.xhtml
     */
    #[Route(
        "/.well-known/change-password",
        name: "ntas_wellknown_change_password"
    )]
    #[SecurityStrategy(Firewall::STRATEGY_NO_CHECK)]
    public function changePassword(Request $request): Response
    {
        return new RedirectResponse(
            $request->getBasePath() . '/front/updatepassword.php',
            Response::HTTP_TEMPORARY_REDIRECT
        );
    }
}
