<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Controller\Altcha;

use Glpi\Altcha\AltchaManager;
use Glpi\Controller\AbstractController;
use Glpi\Http\Firewall;
use Glpi\Security\Attribute\SecurityStrategy;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

final class ChallengeController extends AbstractController
{
    #[SecurityStrategy(Firewall::STRATEGY_NO_CHECK)]
    #[Route(
        "/Altcha/Challenge",
        name: "ntas_altcha_challenge",
        methods: "GET",
    )]
    public function __invoke(): Response
    {
        $challenge = AltchaManager::getInstance()->generateChallenge();
        return new JsonResponse($challenge);
    }
}
