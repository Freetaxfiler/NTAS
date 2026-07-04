<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\OAuth;

use League\OAuth2\Server\Entities\AccessTokenEntityInterface;
use League\OAuth2\Server\Entities\ClientEntityInterface;
use League\OAuth2\Server\Repositories\AccessTokenRepositoryInterface;
use Safe\DateTime;

class AccessTokenRepository implements AccessTokenRepositoryInterface
{
    /**
     * @param ClientEntityInterface $clientEntity
     * @param array $scopes
     * @param ?string $userIdentifier
     *
     * @return AccessTokenEntityInterface
     */
    public function getNewToken(ClientEntityInterface $clientEntity, array $scopes, $userIdentifier = null): AccessTokenEntityInterface
    {
        $token = new AccessToken();
        $token->setClient($clientEntity);
        if ($userIdentifier !== null) {
            $token->setUserIdentifier($userIdentifier);
        }
        foreach ($scopes as $scope) {
            $token->addScope($scope);
        }
        return $token;
    }

    public function persistNewAccessToken(AccessTokenEntityInterface $accessTokenEntity): void
    {
        global $DB;

        // clean expired tokens
        $DB->delete('ntas_oauth_access_tokens', [
            'date_expiration' => ['<', date('Y-m-d H:i:s')],
        ]);

        $DB->insert('ntas_oauth_access_tokens', [
            'identifier' => $accessTokenEntity->getIdentifier(),
            'client' => $accessTokenEntity->getClient()->getIdentifier(),
            'date_expiration' => $accessTokenEntity->getExpiryDateTime()->format('Y-m-d H:i:s'),
            'user_identifier' => $accessTokenEntity->getUserIdentifier(),
            'scopes' => exportArrayToDB($accessTokenEntity->getScopes()),
        ]);
    }

    /**
     * @param string $tokenId
     *
     * @return void
     */
    public function revokeAccessToken($tokenId): void
    {
        global $DB;

        $DB->delete('ntas_oauth_access_tokens', ['identifier' => $tokenId]);
    }

    /**
     * Revoke all access tokens issued for the given client.
     *
     * @param string $clientIdentifier
     *
     * @return void
     */
    public function revokeByClient(string $clientIdentifier): void
    {
        global $DB;

        $DB->delete('ntas_oauth_access_tokens', ['client' => $clientIdentifier]);
    }

    /**
     * @param string $tokenId
     *
     * @return bool
     */
    public function isAccessTokenRevoked($tokenId): bool
    {
        global $DB;

        $iterator = $DB->request([
            'SELECT' => ['identifier', 'date_expiration'],
            'FROM' => 'ntas_oauth_access_tokens',
            'WHERE' => [
                'identifier' => $tokenId,
            ],
        ]);
        if (count($iterator) === 0) {
            return true;
        }
        // Check if the token is expired
        $expiration = $iterator->current()['date_expiration'];
        return (new DateTime($expiration)) < new DateTime();
    }
}
