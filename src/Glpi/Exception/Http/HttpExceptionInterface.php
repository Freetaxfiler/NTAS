<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Exception\Http;

interface HttpExceptionInterface extends \Symfony\Component\HttpKernel\Exception\HttpExceptionInterface
{
    /**
     * Get the message to display.
     */
    public function getMessageToDisplay(): ?string;

    /**
     * Get the specific link text.
     */
    public function getLinkText(): ?string;

    /**
     * Get the specific link URL.
     */
    public function getLinkUrl(): ?string;
}
