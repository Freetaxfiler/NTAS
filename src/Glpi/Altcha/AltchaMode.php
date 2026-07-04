<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Altcha;

use LogicException;

enum AltchaMode: string
{
    case DISABLED = "disabled";
    case HIDDEN = "hidden";
    case AUTO = "auto";
    case INTERACTIVE = "interactive";

    public function isEnabled(): bool
    {
        return match ($this) {
            self::DISABLED    => false,
            self::HIDDEN      => true,
            self::AUTO        => true,
            self::INTERACTIVE => true,
        };
    }

    public function isVisible(): bool
    {
        return match ($this) {
            self::DISABLED    => throw new LogicException(),
            self::HIDDEN      => false,
            self::AUTO        => true,
            self::INTERACTIVE => true,
        };
    }

    public function shouldStartOnLoad(): bool
    {
        return match ($this) {
            self::DISABLED    => throw new LogicException(),
            self::HIDDEN      => true,
            self::AUTO        => true,
            self::INTERACTIVE => false,
        };
    }
}
