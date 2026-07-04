<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Api\HL\Middleware;

interface ResponseMiddlewareInterface
{
    public function process(MiddlewareInput $input, callable $next): void;

    /**
     * @param MiddlewareInput $input
     * @param callable $next
     * @return void
     */
    public function __invoke(MiddlewareInput $input, callable $next);
}
