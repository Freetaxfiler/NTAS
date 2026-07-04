<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Controller\Form\Destination;

use Glpi\Application\View\TemplateRenderer;
use Glpi\Controller\AbstractController;
use Glpi\Exception\Http\AccessDeniedHttpException;
use Glpi\Exception\Http\BadRequestHttpException;
use Glpi\Form\Destination\FormDestination;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class GetDestinationFormController extends AbstractController
{
    #[Route("/Form/{form_id}/Destinations/{destination_id}", name: "ntas_form_destination_get_form", methods: "GET")]
    public function __invoke(Request $request, int $form_id, int $destination_id): Response
    {
        $destination = new FormDestination();
        $loaded = $destination->getFromDB($destination_id);
        if (!$loaded) {
            throw new BadRequestHttpException();
        }

        // Right check
        if (!$destination->can($destination_id, READ)) {
            throw new AccessDeniedHttpException();
        }

        $twig = TemplateRenderer::getInstance()->render('pages/admin/form/form_destination_form.html.twig', [
            'destination' => $destination,
            'form' => $destination->getForm(),
            'can_update' => FormDestination::canUpdate() && $destination->canUpdateItem(),
            'concrete_destination' => $destination->getConcreteDestinationItem(),
        ]);
        return new Response($twig);
    }
}
