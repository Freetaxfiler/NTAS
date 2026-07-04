<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Http;

use Toolbox;

use function Safe\json_encode;

/**
 * @since 10.0.0
 */
class Response extends \GuzzleHttp\Psr7\Response
{
    /**
     * "application/json" content type.
     */
    public const CONTENT_TYPE_JSON = 'application/json';

    /**
     * "text/html" content type.
     */
    public const CONTENT_TYPE_TEXT_HTML = 'text/html';

    /**
     * "text/plain" content type.
     */
    public const CONTENT_TYPE_TEXT_PLAIN = 'text/plain';

    /**
     * Send the given HTTP code then die with the error message in the given format.
     *
     * @param int     $code          HTTP code to set for the response
     * @param string  $message       Error message to send
     * @param string  $content_type  Response content type
     *
     * @return never
     *
     * @deprecated 11.0.0
     */
    public static function sendError(int $code, string $message, string $content_type = self::CONTENT_TYPE_JSON): never
    {
        Toolbox::deprecated('Response::sendError() is deprecated. Throw a `Glpi\Exception\Http\*HttpException` exception instead.');

        switch ($content_type) {
            case self::CONTENT_TYPE_JSON:
                $output = json_encode(['message' => $message]);
                break;

            case self::CONTENT_TYPE_TEXT_HTML:
            default:
                $output = $message;
                break;
        }

        header(sprintf('Content-Type: %s; charset=UTF-8', $content_type), true, $code);

        Toolbox::logDebug($message);

        echo($output);
        exit(1); // @phpstan-ignore glpi.forbidExit (Deprecated scope)
    }

    /**
     * @deprecated 11.0.0
     */
    public function sendHeaders(): Response
    {
        if (headers_sent()) {
            return $this;
        }
        $headers = $this->getHeaders();
        foreach ($headers as $name => $values) {
            header(sprintf('%s: %s', $name, implode(', ', $values)), true);
        }
        http_response_code($this->getStatusCode()); // @phpstan-ignore glpi.forbidHttpResponseCode (Deprecated scope)
        return $this;
    }

    /**
     * @deprecated 11.0.0
     */
    public function sendContent(): Response
    {
        echo $this->getBody();
        return $this;
    }

    /**
     * @deprecated 11.0.0
     */
    public function send(): Response
    {
        return $this->sendHeaders()
            ->sendContent();
    }
}
