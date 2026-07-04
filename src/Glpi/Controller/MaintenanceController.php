<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

declare(strict_types=1);

namespace Glpi\Controller;

use Glpi\Http\Firewall;
use Glpi\Security\Attribute\SecurityStrategy;
use Symfony\Component\HttpFoundation\Response;

class MaintenanceController extends AbstractController
{
    /**
     * Internal route that displays the "maintenance" page.
     */
    #[SecurityStrategy(Firewall::STRATEGY_NO_CHECK)]
    public function __invoke(): Response
    {
        global $CFG_GLPI;

        return $this->render(
            'maintenance.html.twig',
            [
                'lang'      => $CFG_GLPI["languages"][$_SESSION['glpilanguage']][3],
            ]
        );
    }
}
