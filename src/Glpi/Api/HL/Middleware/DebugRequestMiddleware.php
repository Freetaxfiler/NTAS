<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Api\HL\Middleware;

use Session;

class DebugRequestMiddleware extends AbstractMiddleware implements RequestMiddlewareInterface
{
    public function process(MiddlewareInput $input, callable $next): void
    {
        if (
            Session::haveRight('config', UPDATE)
            && $input->request->hasHeader('X-Debug-Mode')
            && filter_var($input->request->getHeaderLine('X-Debug-Mode'), FILTER_VALIDATE_BOOLEAN)
        ) {
            $_SESSION['ntas_use_mode'] = Session::DEBUG_MODE;
        }
        $next($input);
    }
}
