<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Controller\UI\Illustration;

use Glpi\Controller\AbstractController;
use Glpi\Exception\Http\BadRequestHttpException;
use Glpi\Http\Firewall;
use Glpi\Security\Attribute\SecurityStrategy;
use Glpi\UI\IllustrationManager;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class CustomIllustrationController extends AbstractController
{
    public function __construct(
        private IllustrationManager $illustration_manager
    ) {}

    #[SecurityStrategy(Firewall::STRATEGY_AUTHENTICATED)]
    #[Route(
        "/UI/Illustration/CustomIllustration/{id}",
        name: "ntas_ui_illustration_custom_illustration",
        methods: "GET",
    )]
    public function __invoke(string $id): Response
    {
        $file = $this->illustration_manager->getCustomIllustrationFile($id);
        if (!$file) {
            throw new BadRequestHttpException();
        }

        // Read parameters
        return new BinaryFileResponse($file);
    }
}
