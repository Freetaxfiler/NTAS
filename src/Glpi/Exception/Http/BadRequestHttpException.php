<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Exception\Http;

use Symfony\Component\HttpKernel\Exception\BadRequestHttpException as BaseException;

class BadRequestHttpException extends BaseException implements HttpExceptionInterface
{
    use HttpExceptionTrait;
}
