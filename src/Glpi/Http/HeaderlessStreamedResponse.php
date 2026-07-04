<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Http;

use Symfony\Component\HttpFoundation\StreamedResponse;

/**
 * Sends a streamed response without specific headers.
 * Headers could still be sent by the callback function.
 * This class is for internal use only and is a temporary solution to get around the following PHP bug:
 * - https://bugs.php.net/bug.php?id=81451
 * - https://stackoverflow.com/questions/69197771/why-is-function-http-response-code-acting-strange-that-was-called-after-functi/69213593#69213593
 *
 * @since 11.0.0
 * @deprecated 11.0.0
 */
class HeaderlessStreamedResponse extends StreamedResponse
{
    public function __construct(?callable $callback = null)
    {
        parent::__construct($callback);
    }

    public function sendHeaders(): static
    {
        // Sending headers is disabled.

        return $this;
    }
}
