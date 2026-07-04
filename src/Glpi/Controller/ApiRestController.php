<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Controller;

use Glpi\Api\APIRest;
use Glpi\Http\HeaderlessStreamedResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class ApiRestController extends AbstractController
{
    #[Route(
        "/apirest.php{request_parameters}",
        name: "ntas_api_rest",
        requirements: [
            'request_parameters' => '.*',
        ]
    )]
    public function __invoke(Request $request): Response
    {
        $_SERVER['PATH_INFO'] = $request->get('request_parameters');

        // @phpstan-ignore-next-line method.deprecatedClass (refactoring is planned later)
        return new HeaderlessStreamedResponse(function () {
            $api = new APIRest();
            $api->call();
        });
    }
}
