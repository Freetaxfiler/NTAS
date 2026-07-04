<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form;

final class DelegationData
{
    public function __construct(
        public readonly ?int $users_id = null,
        public readonly ?bool $use_notification = null,
        public readonly ?string $alternative_email = null
    ) {}
}
