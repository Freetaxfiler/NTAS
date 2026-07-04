<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Api\HL\Middleware;

use Glpi\Api\HL\RoutePath;
use Glpi\Http\Request;
use Psr\Http\Message\ResponseInterface;

final class MiddlewareInput
{
    public function __construct(
        public Request $request,
        public RoutePath $route_path,
        public ?ResponseInterface $response,
        public ?array $client = null,
    ) {}
}
