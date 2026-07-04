<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Message;

enum MessageType: string
{
    case Error = 'error';
    case Warning = 'warning';
    case Notice = 'notice';
    case Success = 'success';
    case Debug = 'debug';
}
