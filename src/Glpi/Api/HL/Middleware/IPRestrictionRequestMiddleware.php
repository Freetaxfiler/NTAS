<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Api\HL\Middleware;

use Glpi\Api\HL\Router;
use Glpi\Http\JSONResponse;
use League\OAuth2\Server\Exception\OAuthServerException;

use function Safe\inet_pton;

class IPRestrictionRequestMiddleware extends AbstractMiddleware implements RequestMiddlewareInterface
{
    public function process(MiddlewareInput $input, callable $next): void
    {
        if (!\array_key_exists('REMOTE_ADDR', $_SERVER)) {
            // If `$_SERVER['REMOTE_ADDR']` is not set, it means that the request is made in CLI context (i.e. inside test suite).
            $next($input);
            return;
        }

        // Determine client_id from current route or request parameters
        $client = Router::getInstance()->getCurrentClient();
        if ($client !== null) {
            $client_id = $client['client_id'];
        } elseif ($input->request->hasParameter('client_id')) {
            $client_id = $input->request->getParameter('client_id');
        } else {
            $client_id = null;
        }

        if ($client_id === null) {
            $next($input);
            return;
        }

        // Check if client is allowed for the remote IP
        if (!$this->isClientIPAllowed((string) $client_id, $_SERVER['REMOTE_ADDR'])) {
            $input->response = OAuthServerException::accessDenied(
                'Your IP address is not allowed to use this OAuth client.'
            )->generateHttpResponse(new JSONResponse());
            return;
        }

        $next($input);
    }

    private function isClientIPAllowed(string $client_id, string $ip): bool
    {
        global $DB;

        $result = $DB->request([
            'SELECT' => ['allowed_ips'],
            'FROM'   => 'ntas_oauthclients',
            'WHERE'  => ['identifier' => $client_id],
        ])->current();
        $allowed_ips = $result['allowed_ips'] ?? [];

        if (empty($allowed_ips)) {
            return true;
        }

        return $this->isIPAllowed($ip, $allowed_ips);
    }

    private function isIPAllowed(string $ip, string $allowed_ips): bool
    {
        $allowed_ip_array = array_map('trim', explode(',', $allowed_ips));
        foreach ($allowed_ip_array as $allowed_ip) {
            if (str_contains($allowed_ip, '/')) {
                if ($this->isCidrMatch($ip, $allowed_ip)) {
                    return true;
                }
            } elseif ($ip === $allowed_ip) {
                return true;
            }
        }
        return false;
    }

    /**
     * Check that the given IP is in the given CIDR range
     * @param string $ip The IP to check
     * @param string $range The CIDR notation range
     * @return bool
     */
    private function isCidrMatch(string $ip, string $range): bool
    {
        $ipv6 = str_contains($ip, ':');
        $max_mask = $ipv6 ? 128 : 32;
        [$subnet, $mask] = explode('/', $range);
        $subnet = inet_pton($subnet);
        $ip = inet_pton($ip);
        $mask = $mask === '' ? $max_mask : (int) $mask;
        $subnet = substr($subnet, 0, $mask / 8);
        $ip = substr($ip, 0, $mask / 8);
        return $subnet === $ip;
    }
}
