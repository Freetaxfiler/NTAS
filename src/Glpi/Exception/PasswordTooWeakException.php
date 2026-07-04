<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Exception;

use Exception;

class PasswordTooWeakException extends Exception
{
    /** @var array */
    private $messages = [];

    /**
     * @param string $message
     *
     * @return void
     */
    public function addMessage($message)
    {
        $this->messages[] = $message;
    }

    /**
     * @return array
     */
    public function getMessages()
    {
        return $this->messages;
    }
}
