<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Console\Exception;

use Exception;
use Symfony\Component\Console\Exception\ExceptionInterface;

/**
 * This exception is used to easilly trigger an exit of current command from a sub method.
 *
 * @since 10.0.0
 */
class EarlyExitException extends Exception implements ExceptionInterface {}
