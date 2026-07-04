<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Controller\Config;

use AuthLDAP;
use AuthLdapReplicate;
use Glpi\Controller\AbstractController;
use Glpi\Exception\Http\AccessDeniedHttpException;
use Glpi\Exception\Http\NotFoundHttpException;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class LDAPController extends AbstractController
{
    #[Route(
        "/AuthLDAP/{authldaps_id}/Replica/{authldapreplicates_id}/Test",
        name: "authldap_replica_status",
        requirements: [
            'authldaps_id' => '\d+',
            'authldapreplicates_id' => '\d+',
        ],
        methods: ['POST'],
    )]
    public function testReplica(Request $request): Response
    {
        if (!AuthLDAP::canUpdate()) {
            throw new AccessDeniedHttpException();
        }
        $authldap = new AuthLDAP();
        $replicate = new AuthLdapReplicate();
        if (!$authldap->getFromDB($request->get('authldaps_id')) || !$replicate->getFromDB($request->get('authldapreplicates_id'))) {
            throw new NotFoundHttpException();
        }

        if (AuthLDAP::testLDAPConnection($authldap->getID(), $replicate->getID())) {
            return new Response();
        } else {
            return new Response('', Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
