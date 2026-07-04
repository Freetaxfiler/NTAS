<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\OAuth;

use Glpi\DBAL\QuerySubQuery;
use League\OAuth2\Server\Entities\RefreshTokenEntityInterface;
use League\OAuth2\Server\Repositories\RefreshTokenRepositoryInterface;

class RefreshTokenRepository implements RefreshTokenRepositoryInterface
{
    /**
     * @return RefreshToken|null
     */
    public function getNewRefreshToken(): ?RefreshTokenEntityInterface
    {
        return new RefreshToken();
    }

    public function persistNewRefreshToken(RefreshTokenEntityInterface $refreshTokenEntity): void
    {
        global $DB;

        // clean expired tokens
        $DB->delete('ntas_oauth_refresh_tokens', [
            'date_expiration' => ['<', date('Y-m-d H:i:s')],
        ]);

        $DB->insert('ntas_oauth_refresh_tokens', [
            'identifier' => $refreshTokenEntity->getIdentifier(),
            'access_token' => $refreshTokenEntity->getAccessToken()->getIdentifier(),
            'date_expiration' => $refreshTokenEntity->getExpiryDateTime()->format('Y-m-d H:i:s'),
        ]);
    }

    /**
     * @param string $tokenId
     *
     * @return void
     */
    public function revokeRefreshToken($tokenId): void
    {
        global $DB;

        $DB->delete('ntas_oauth_refresh_tokens', [
            'identifier' => $tokenId,
        ]);
    }

    /**
     * Revoke all refresh tokens whose linked access token was issued for the given client.
     *
     * @param string $clientIdentifier
     *
     * @return void
     */
    public function revokeByClient(string $clientIdentifier): void
    {
        global $DB;

        $DB->delete('ntas_oauth_refresh_tokens', [
            'access_token' => new QuerySubQuery([
                'SELECT' => 'identifier',
                'FROM'   => 'ntas_oauth_access_tokens',
                'WHERE'  => ['client' => $clientIdentifier],
            ]),
        ]);
    }

    /**
     * @param string $tokenId
     *
     * @return bool
     */
    public function isRefreshTokenRevoked($tokenId): bool
    {
        global $DB;

        $iterator = $DB->request([
            'SELECT' => 'identifier',
            'FROM' => 'ntas_oauth_refresh_tokens',
            'WHERE' => [
                'identifier' => $tokenId,
            ],
        ]);

        return $iterator->count() === 0;
    }
}
